from system.core.controller import *

class Logins(Controller):
    def __init__(self, action):
        super(Logins, self).__init__(action)
        self.load_model('Login')
        self.db = self._app.db
   
    def index(self):
        try: 
            session['id'] != 0
            session['form'] != 0
            session['form2'] != 0
        except:
            session['id'] = ""
            session['form'] = ""
            session['form2'] = ""
        return self.load_view('index.html')

    def show(self):
        return self.load_view('success.html')

    def register(self):
        session['form'] = request.form
        user = self.models['Login'].register_user(request.form)
        if user == "err1":
            flash("Invalid First Name. (Letters only, at least 2 characters.)")
        elif user == "err2":
            flash("Invalid Last Name. (Letters only, at least 2 characters.)")
        elif user == "err3":
            flash("Invalid Email Address.")
        elif user == "err4":
            flash("Account already exists with this email. Please choose different email to register.")
        elif user == "err5":
            flash("Password must be more than 8 characters.")
        elif user == "err6":
            flash("Passwords do not match! Try again!")
        elif user == "err7":
            flash("Password requires to have at least 1 uppercase letter and 1 numeric value.")
        else:
            session['first_name']  = user
            return redirect('success')
        return redirect('/')

    def login(self):
        user = self.models['Login'].login_user(request.form)
        if user:
            session['id'],session['first_name']  = user
            return redirect('success')
        flash( "Wrong email and/or password.")
        return redirect('/')

    def logout(self):
        del session['id']
        del session['first_name']
        del session['form']
        del session['form2']
        return redirect('/')