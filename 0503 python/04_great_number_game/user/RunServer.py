from flask import Flask, session, render_template, url_for, request, redirect
import random

app = Flask(__name__)
app.secret_key = 'ThisIsSecret' # you need to set a secret key for security purposes

def genRand():
  session['rand'] = random.randrange(0, 101) # random number between 0-100

def genResult():
  if (session['rand'] == session['guess']):
    session['result'] = "good!"
  if (session['rand']!=session['guess']):
    session['result'] = "guess again"
  # guess=session['guess']
  # random=session['rand']
  # result=session['result']
  # if session['guess'] < session['rand']:
  #   session['result'] = "ran hi"
  # if session['guess'] > session['rand']:
  #   session['result'] = "gue hi"
  # else:
  #   session['result'] = "ok..."

@app.route('/')     
def index():
  genRand()
  return render_template('index.html', random=session['rand'])

@app.route('/play', methods=['POST'])
def play():
  print "Got Post Info"
  session['guess'] = request.form['guess']
  genResult()
  return redirect('/show') # noticed that we changed where we redirect to so 
# that we can go to the page that displays the name and email!

@app.route('/show')
def show_user():
  return render_template('index.html', random=session['rand'], guess=session['guess'], result=session['result'])

# This route will clear the variable sessions
# This functionality can come handy for example when we logout
# a user from our app and we want to clear its information
@app.route('/clear')
def clearsession():
    # Clear the session
    session.clear()
    # Redirect the user to the main page
    return redirect(url_for('index'))

app.run(debug=True)