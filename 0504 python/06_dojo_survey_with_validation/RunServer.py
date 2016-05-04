from flask import Flask, render_template, request, redirect, flash  # Import Flask to allow us to create our app.
app = Flask(__name__)    # Global variable __name__ tells Flask whether or not we are running the file
app.secret_key = 'KeepItSecretKeepItSafe'
                         # directly, or importing it as a module.
@app.route('/')          # The "@" symbol designates a "decorator" which attaches the following
                         # function to the '/' route. This means that whenever we send a request to
                         # localhost:5000/ we will run the following "hello_world" function.
def index():
	return render_template('index.html')

@app.route('/process', methods=['POST'])
def process():
	print "Got Post Info"
	name = request.form['name']
	location = request.form['location']
	language = request.form['language']
	comment = request.form['comment']
	if len(request.form['name']) < 1:
		flash("Name cannot be empty!") # just pass a string to the flash function
	else:
		flash("Success! Your name is {}".format(request.form['name'])) # just pass a string to the flash function
	if len(request.form['comment']) < 1:
		flash("Comment cannot be empty!") # just pass a string to the flash function
	elif len(request.form['comment']) > 120:
		flash("Comment cannot be more than 120 characters!") # just pass a string to the flash function
	else:
		flash("Success! Your comment is {}".format(request.form['comment'])) # just pass a string to the flash function	
	return render_template('/result.html', name=name, location=location, language=language, comment=comment)

app.run(debug=True)		# Run the app in debug mode.