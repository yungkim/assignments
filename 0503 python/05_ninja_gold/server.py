from flask import Flask, session, render_template, url_for, request, redirect
import random, datetime

app = Flask(__name__)
app.secret_key = 'ThisIsSecret' # you need to set a secret key for security purposes

def total(x): # set global session total amount of money here
  try:
    session['total'] += x
  except KeyError:
    session['total'] = x

@app.route('/')     
def index():
  session['total'] = 0; # initial money must be set here, loads one time until clearsession() is called
  session['sResult'] = ""
  return render_template('index.html')

@app.route('/process_money', methods=['POST'])
def process():
  print "Got Post Info"
  money = request.form['building']

  if (money == 'farm'):
    plus = random.randrange(10, 21)
    session['total'] += plus
    result = "Earned "+str(plus)+" golds from the farm! "+str(datetime.datetime.now())
    session['sResult'] = str(result) + "\n" + session['sResult']  
  elif (money == 'cave'):
    plus = random.randrange(5, 11)
    session['total'] += plus
    result = "Earned "+str(plus)+" golds from the cave! "+str(datetime.datetime.now())
    session['sResult'] = str(result) + "\n" + session['sResult']
  elif (money == 'house'):
    plus = random.randrange(2, 6)
    session['total'] += plus
    result = "Earned "+str(plus)+" golds from the house! "+str(datetime.datetime.now())
    session['sResult'] = str(result) + "\n" + session['sResult']
  elif (money == 'casino'):
    plus = random.randrange(-50, 51)
    session['total'] += plus
    if (plus > 0):
      result = "Earned "+str(plus)+" golds from the Casino! "+str(datetime.datetime.now())
      session['sResult'] = str(result) + "\n" + session['sResult']
    else:
      result = "Entered a casino and lost "+str(plus)+" golds... Ouch..  "+str(datetime.datetime.now())
      session['sResult'] = str(result) + "\n" + session['sResult']
  return render_template('/index.html', money=money, total=session['total'], result=result, sResult=session['sResult'])

@app.route('/clear')
def clearsession():
    # Clear the session
    session.clear()
    session['total'] = 0;
    # Redirect the user to the main page
    return redirect(url_for('index'))
app.run(debug=True)