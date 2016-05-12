from system.core.controller import *

class Surveys(Controller):
    def __init__(self, action):
        super(Surveys, self).__init__(action)
        self.load_model('WelcomeModel')
        self.db = self._app.db
   
    def index(self):
        try:
            session['counter'] != 0 
            # does not set new value (to keep the old session value)
            # same result as --> session['counter'] = session['counter']
        except KeyError:
            session['counter'] = 0
        return self.load_view('index.html')

    def process(self):
        session['counter'] += 1
        session['name'] = request.form['name']
        session['location'] = request.form['location']
        session['language'] = request.form['language']
        session['comment'] = request.form['comment']
        return redirect('/result')

    def clear(self):
        del session['counter']
        return redirect('/')

    def result(self):
        return self.load_view('result.html')
