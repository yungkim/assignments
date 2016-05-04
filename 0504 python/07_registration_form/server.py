from flask import Flask, render_template, request, redirect, flash  # Import Flask to allow us to create our app.
import re, datetime
from datetime import date
EMAIL_REGEX = re.compile(r'^[a-zA-Z0-9\.\+_-]+@[a-zA-Z0-9\._-]+\.[a-zA-Z]*$')
PASSWORD_REGEX = re.compile(r'^([^0-9]*|[^A-Z]*)$')
app = Flask(__name__)    # Global variable __name__ tells Flask whether or not we are running the file
app.secret_key = 'KeepItSecretKeepItSafe'
                         # directly, or importing it as a module.
@app.route('/')          # The "@" symbol designates a "decorator" which attaches the following
                         # function to the '/' route. This means that whenever we send a request to
                         # localhost:5000/ we will run the following "hello_world" function.
def index():
	return render_template('index.html')

def check_date(year, month, day):
    correctDate = None
    try:
        newDate = datetime.datetime(year, month, day)
        correctDate = True
    except ValueError:
        correctDate = False
    return correctDate

@app.route('/process', methods=['POST'])
def process():
	try:
		print "Got Post Info"
		info = { 'email': request.form['email'], 'first_name': request.form['first_name'], 'last_name': request.form['last_name'], 'password': request.form['password'], 'password2': request.form['password2'], 'birth_year': request.form['birth_year'], 'birth_month': request.form['birth_month'], 'birth_day': request.form['birth_day'] }	
		if len(info['email']) < 1:
			flash("Email cannot be empty!") # just pass a string to the flash function
		elif not EMAIL_REGEX.match(info['email']):
			flash("Invalid Email Address!")
		if len(info['first_name']) < 1:
			flash("First name cannot be empty!")
		if len(info['last_name']) < 1:
			flash("Last name cannot be empty!")
		if len(info['password']) < 1:
			flash("Password cannot be empty!")
		elif len(info['password']) < 8:
			flash("Password must be more than 8 characters")
		elif len(info['password2']) < 1:
			flash("Confirm password cannot be empty!")
		elif info['password'] != info['password2']:
			flash("Passwords do not match! Try again!")
		elif PASSWORD_REGEX.match(info['password2']):
			flash("Password requires to have at least 1 uppercase letter and 1 numeric value.")
		else:
			flash("Thanks for submitting your information.") # just pass a string to the flash function	
		date_input = str(info['birth_year'])+"-"+str(info['birth_month'])+"-"+str(info['birth_day'])	
		if check_date(int(info['birth_year']),int(info['birth_month']),int(info['birth_day'])) == False:
			flash("Your birthdate is invalid!")
		elif date_input > str(date.today()):
			flash("Your birthdate must be from the past!")
	except ValueError:
		flash("Please enter your birthdate in number format.")
	return render_template('/result.html', info=info)

app.run(debug=True)		# Run the app in debug mode.