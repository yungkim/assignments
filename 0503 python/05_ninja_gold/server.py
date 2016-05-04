from flask import Flask, session, render_template, url_for, request, redirect
import random, datetime

app = Flask(__name__)
app.secret_key = 'ThisIsSecret' # you need to set a secret key for security purposes

def total(x):
  session['total'] = 0;
  try:
    session['total'] += x
  except KeyError:
    session['total'] = x

@app.route('/')     
def index():
  return render_template('index.html')

@app.route('/process_money', methods=['POST'])
def process():
  print "Got Post Info"
  # session['total'] = 100;
  money = request.form['building']
  if (money == 'farm'):
    plus = random.randrange(10, 21)
    session['total'] += plus
    result = "Earned "+str(plus)+" golds from the farm! "+str(datetime.datetime.now())
  elif (money == 'cave'):
    plus = random.randrange(5, 11)
    session['total'] += plus
    result = "Earned "+str(plus)+" golds from the farm! "+str(datetime.datetime.now())
  elif (money == 'house'):
    plus = random.randrange(2, 6)
    session['total'] += plus
    result = "Earned "+str(plus)+" golds from the farm! "+str(datetime.datetime.now())
  elif (money == 'casino'):
    plus = random.randrange(-50, 51)
    session['total'] += plus
    if (plus > 0):
      result = "Earned "+str(plus)+" golds from the farm! "+str(datetime.datetime.now())
    else:
      result = "Entered a casino and lost "+str(plus)+" golds... Ouch..  "+str(datetime.datetime.now())
  return render_template('/index.html', money=money, total=session['total'], result=result)

@app.route('/clear')
def clearsession():
    # Clear the session
    session.clear()
    session['total'] = 0;
    # Redirect the user to the main page
    return redirect(url_for('index'))
app.run(debug=True)