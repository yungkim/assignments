from system.core.controller import *
from random import randint
from time import strftime
import string

class Ninjas(Controller):
    def __init__(self, action):
        super(Ninjas, self).__init__(action)
        self.load_model('WelcomeModel')
        self.db = self._app.db
   
    def index(self):
        try:
            session['gold'] != 0 
            # does not set new value (to keep the old session value)
            # same result as --> session['counter'] = session['counter']
        except KeyError:
            session['gold'] = 0
            session['activities'] = []
        return self.load_view('index.html')

    def process_money(self):
        if request.form['building'] == 'farm':
            earn = randint(10,20)
            session['gold'] += earn
        elif request.form['building'] == 'cave':
            earn = randint(5,10)
            session['gold'] += earn
        elif request.form['building'] == 'house':
            earn = randint(2,5)
            session['gold'] += earn
        elif request.form['building'] == 'casino':
            earn = randint(-50,50)
            session['gold'] += earn
        if earn >= 0:
            session['activities'].insert(0, { 
                'activity': 'Earned {} golds from the {}! ({})\n'.format(earn, request.form['building'], strftime("%Y/%m/%d %I:%M %p")),
                'color': 'green'
                })
        else:
            session['activities'].insert(0, { 
                'activity': 'Entered a casino and lost {} golds... Ouch.. ({})\n'.format(earn, strftime("%Y/%m/%d %I:%M %p")),
                'color': 'red'
                })
        return self.load_view('index.html')

    def process_clear(self):
        del session['gold']
        del session['activities']
        return redirect('/')