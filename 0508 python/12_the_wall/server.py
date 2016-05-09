from flask import Flask, render_template, request, redirect, flash, session
from mysqlconnection import MySQLConnector # import the Connector function
from flask.ext.bcrypt import Bcrypt # import Bcrypt to hash password
import re
EMAIL_REGEX = re.compile(r'^[a-zA-Z0-9\.\+_-]+@[a-zA-Z0-9\._-]+\.[a-zA-Z]*$')
NAME_REGEX = re.compile(r'^[a-zA-Z ]+$') # Case insensitive "a" to "z" and "space" allowed
PASSWORD_REGEX = re.compile(r'^([^0-9]*|[^A-Z]*)$') # number and upper case letter allowed
app = Flask(__name__)
bcrypt = Bcrypt(app)
app.secret_key = 'KeepItSecretKeepItSafe' 
mysql = MySQLConnector(app, 'login') # connect and store the connection in "mysql" note that you pass the database name to the function

@app.route('/', methods=['GET'])
def index():
	error=1 # use for showing/hiding contents in HTML, assume there could be register error by default
	return render_template('index.html', error=error)

@app.route('/register', methods=['POST'])
def register():
	error = 1 # assume there could be register error by default
	if len(request.form['first_name']) < 2 or not NAME_REGEX.match(request.form['first_name']):
		flash("Invalid First Name. (Letters only, at least 2 characters.)")
	elif len(request.form['last_name']) < 2 or not NAME_REGEX.match(request.form['last_name']):
		flash("Invalid Last Name. (Letters only, at least 2 characters.)")
	elif len(request.form['email']) < 1 or not EMAIL_REGEX.match(request.form['email']):
		flash("Invalid Email Address.")
	# check if email already exists which is required as unique value for users to log in
	elif mysql.query_db("SELECT * FROM users WHERE email = '"+request.form['email']+"'") != [] :
		flash("Account already exists with this email. Please choose different email to register.")
	elif len(request.form['password']) < 8:
		flash("Password must be more than 8 characters.")
	elif request.form['password'] != request.form['confirm_password']:
		flash("Passwords do not match! Try again!")
	elif PASSWORD_REGEX.match(request.form['confirm_password']):
		flash("Password requires to have at least 1 uppercase letter and 1 numeric value.")
	else:
		error = 0 # no register error at this point
		data = {
			'first_name': request.form['first_name'],
			'last_name': request.form['last_name'],
			'email': request.form['email'],
			# run validations and if they are successful we can create the password hash with bcrypt
			'pw_hash': bcrypt.generate_password_hash(request.form['password']),
			'confirm_password': request.form['confirm_password'],
		}
		# start mySQL insert
		register_query = "INSERT INTO users (first_name, last_name, email, pw_hash, created_at, updated_at) VALUES (:first_name, :last_name, :email, :pw_hash, NOW(), NOW())"
		mysql.query_db(register_query, data)
		# end mySQL insert
		# start mySQL select
		user_list_query = "SELECT * FROM users ORDER BY id DESC"
		user_list = mysql.query_db(user_list_query)
		# end mySQL select
		session['logged_in'] = "Logged in";
		session['logged_user_info'] = {'id': user_list[0]['id'], 'first_name': user_list[0]['first_name'], 'last_name': user_list[0]['last_name']}
		return redirect('/wall_update')#, error=error, user_list=user_list)
	return render_template('/index.html')

@app.route('/login', methods=['POST'])
def login():
	try:
		user_query = "SELECT * FROM users WHERE email = :email LIMIT 1"
		query_data = { 'email': request.form['email'] }
		user = mysql.query_db(user_query, query_data) # search if email account exists, returns "[]" if account does not exist
		if len(request.form['password']) < 8 or not EMAIL_REGEX.match(request.form['email']) or user == [] or not bcrypt.check_password_hash(user[0]['pw_hash'], request.form['password']):
			flash("Wrong email and/or password.") # login fails with all these if conditions
		else:
			# start mySQL select
			user_list_query = "SELECT * FROM users"
			user_list = mysql.query_db(user_list_query)
			# end mySQL select
			session['logged_in'] = "Logged in";
			session['logged_user_info'] = {'id': user[0]['id'], 'first_name': user[0]['first_name'], 'last_name': user[0]['last_name']}
			return redirect('/wall_update')
	except ValueError: # if database contains invalid values (ex. password is not hashed)
		flash("Database corrupted. Please contact admin and register your account again.")
	return render_template('/index.html')

@app.route('/logout')
def logout():
    session.clear()
    return redirect('/')

@app.route('/message', methods=['POST'])
def message():
	if request.form['message'] != '':
		# start mySQL insert
		add_message_query = "INSERT INTO messages (user_id, message, created_at, updated_at) VALUES (:id, :message, NOW(), NOW())"
		message = { 'id': session['logged_user_info']['id'], 'message': request.form['message'] }
		mysql.query_db(add_message_query, message)
		# end mySQL insert
		return redirect('/wall_update')
	return redirect('/wall_update')

@app.route('/comment', methods=['POST'])
def comment():
	if request.form['comment'] != '':
		# start mySQL insert
		add_comment_query = "INSERT INTO comments (message_id, user_id, comment, created_at, updated_at) VALUES (:message_id, :user_id, :comment, NOW(), NOW())"
		comment = { 'message_id': request.form['message_id'], 'user_id': session['logged_user_info']['id'], 'comment': request.form['comment'] }
		mysql.query_db(add_comment_query, comment)
		# end mySQL insert
		return redirect('/wall_update')
	return redirect('/wall_update')

@app.route('/wall_update')
def wall_update():
	postings = mysql.query_db("SELECT messages.id, first_name, message, messages.created_at FROM users LEFT JOIN messages ON users.id = messages.user_id WHERE message is not null ORDER BY created_at DESC;")	
	comments_ready_to_display = mysql.query_db("SELECT first_name, message_id, comment, comments.created_at FROM users JOIN comments ON users.id = comments.user_id JOIN messages ON messages.id = comments.message_id WHERE message_id = message_id ORDER BY created_at DESC;")
	return render_template('/result.html', postings=postings, comments_ready_to_display=comments_ready_to_display)

@app.route('/delete/<id>')
def delete_message(id):
	delete_message_query = "DELETE FROM messages WHERE id = :id"
	data = { 'id': id }
	mysql.query_db(delete_message_query, data)
	# start mySQL select
	message_list_query = "SELECT * FROM messages"
	view_message_list = mysql.query_db(message_list_query)
	# end mySQL select

	# incomplete !!! (Message delete disabled after 30 minutes)
	# start mySQL select (messages created within 30 minutes from now)
	recent_message_list_query = "SELECT * FROM messages WHERE created_at BETWEEN NOW() - INTERVAL 30 MINUTE AND NOW();"
	view_recent_message_list = mysql.query_db(recent_message_list_query)
	# end mySQL select
	postings = mysql.query_db("SELECT messages.id, first_name, message, messages.created_at FROM users LEFT JOIN messages ON users.id = messages.user_id WHERE message is not null ORDER BY created_at DESC;")	
	comments_ready_to_display = mysql.query_db("SELECT first_name, message_id, comment, comments.created_at FROM users JOIN comments ON users.id = comments.user_id JOIN messages ON messages.id = comments.message_id WHERE message_id = message_id ORDER BY created_at DESC;")
	recent_message=view_recent_message_list[0]['created_at']
	# incomplete !!! (Message delete disabled after 30 minutes)
	
	return render_template('/result.html', view_message_list=view_message_list, postings=postings, comments_ready_to_display=comments_ready_to_display)

@app.route('/remove/<id>')
def delete_user(id):
	delete_user_query = "DELETE FROM users WHERE id = :id"
	data = { 'id': id }
	mysql.query_db(delete_user_query, data)
	# start mySQL select
	user_list_query = "SELECT * FROM users"
	view_user_list = mysql.query_db(user_list_query)
	# end mySQL select
	return render_template('/result.html', view_user_list=view_user_list)

app.run(debug=True)