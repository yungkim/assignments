from flask import Flask, render_template, request, redirect, flash  # Import Flask to allow us to create our app.
app = Flask(__name__)    # Global variable __name__ tells Flask whether or not we are running the file
#app.secret_key = 'KeepItSecretKeepItSafe'
                         # directly, or importing it as a module.
@app.route('/')          # The "@" symbol designates a "decorator" which attaches the following
                         # function to the '/' route. This means that whenever we send a request to
                         # localhost:5000/ we will run the following "hello_world" function.
def index():
	return render_template('index.html')

@app.route('/ninja')
def ninja():
	ninjacolor = 'static/img/tmnt.png'
	return render_template("ninja.html", ninjacolor=ninjacolor)

@app.route('/ninja/<ninjaname>')
def show_ninja(ninjaname):
	if ninjaname =='blue':
		ninjacolor = '../static/img/leonardo.jpg'
	elif ninjaname == 'red':
		ninjacolor = '../static/img/raphael.jpg'
	elif ninjaname == 'purple':
		ninjacolor = '../static/img/donatello.jpg'
	elif ninjaname == 'orange':
		ninjacolor = '../static/img/michelangelo.jpg'
	else:
		ninjacolor = '../static/img/notapril.jpg'
	return render_template("ninja.html", ninjaname=ninjaname, ninjacolor=ninjacolor)

app.run(debug=True, port=8888)		# Run the app in debug mode.