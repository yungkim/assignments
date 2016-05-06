from flask import Flask, render_template, request, redirect, flash, session
from mysqlconnection import MySQLConnector
import re
EMAIL_REGEX = re.compile(r'^[a-zA-Z0-9\.\+_-]+@[a-zA-Z0-9\._-]+\.[a-zA-Z]*$')
# import the Connector function
from mysqlconnection import MySQLConnector
app = Flask(__name__)
# connect and store the connection in "mysql" note that you pass the database name to the function
app.secret_key = 'KeepItSecretKeepItSafe'
mysql = MySQLConnector(app, 'email')
# an example of running a query
print mysql.query_db("SELECT * FROM emails")

@app.route('/')
def index():
	return render_template('index.html')

@app.route('/result', methods=['POST'])
def result():
	print "Got Post Info"
	session['email'] = request.form['email']
	if len(session['email']) < 1:
		flash("Email cannot be empty!") # just pass a string to the flash function
	elif not EMAIL_REGEX.match(session['email']):
		flash("Invalid Email Address!")
	else:
		# start mySQL insert
		query = "INSERT INTO emails (email, created_at, updated_at)  VALUES (:email, NOW(), NOW())"
		data = {
				'email': request.form['email'],
				}
		mysql.query_db(query, data)
		# end mySQL insert
		# start mySQL select
		email_list_query = "SELECT * FROM emails"
		email_list = mysql.query_db(email_list_query)
		# end mySQL select
		return render_template('/result.html', email=session['email'], email_list=email_list)
	return render_template('/index.html', email=session['email'])

@app.route('/remove/<id>')
def delete_email(id):
	if 'email' in session:
		del session['email']
	delete_email_query = "DELETE FROM emails WHERE id = :id"
	data = {
			'id': id
			}
	mysql.query_db(delete_email_query, data)
	# start mySQL select
	email_list_query = "SELECT * FROM emails"
	email_list = mysql.query_db(email_list_query)
	# end mySQL select
	return render_template('/result.html', email="test", email_list=email_list)
	
app.run(debug=True)