from flask import Flask, session, render_template, url_for, request, redirect
app = Flask(__name__)
app.secret_key = 'ThisIsSecret' # you need to set a secret key for security purposes
     

# We'll use this function later to initialise or increment
# a counter that will be stored as a session variable
# This function will be called from every route, so it will
# keep a record of how many routes/pages have been loaded
def sumSessionCounter():
  try:
    session['counter'] += 1
  except KeyError:
    session['counter'] = 1

@app.route('/')     
def index():
  # Initialise the counter, or increment it
  sumSessionCounter()
  session['counter'] = session['counter']
  return render_template('index.html', counter=session['counter'])

# @app.route('/users', methods=['POST'])
# def create_user():
#   print "Got Post Info"
  # here we add two properties to session to store the name and email
  # session['name'] = request.form['name']
  # session['email'] = request.form['email']
  # return redirect('/show') # noticed that we changed where we redirect to so 
#that we can go to the page that displays the name and email!

# @app.route('/show')
# def show_user():
#   return render_template('user.html', name=session['name'], email=session['email'])

# This route will clear the variable sessions
# This functionality can come handy for example when we logout
# a user from our app and we want to clear its information
@app.route('/clear')
def clearsession():
    # Clear the session
    session.clear()
    # Redirect the user to the main page
    return redirect(url_for('index'))

@app.route('/plus2')
def plus2():
    sumSessionCounter() # increment extra count 1
    # Redirect the user to the main page
    return redirect(url_for('index'))

app.run(debug=True)