from system.core.controller import *

class Books(Controller):
    def __init__(self, action):
        super(Books, self).__init__(action)
        self.load_model('Book')
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
        items = self.models['Book'].get_data()
        return self.load_view('books.html', items=items[0], random=items[1])

    def books_page(self, item_id):
        items = self.models['Book'].get_book_by_id(item_id)
        return self.load_view('books/page.html', items=items, item_id=item_id)

    def users_page(self, item_id):
        items = self.models['Book'].get_user_by_id(item_id)
        return self.load_view('users/page.html', items=items[0], count=items[1], item_id=item_id)

    def process_register(self):
        session['form'] = request.form
        user = self.models['Book'].register_user(request.form)
        if user == "err1":
            flash("Invalid Name. (Letters only, at least 2 characters.)")
        elif user == "err2":
            flash("Invalid Alias. (Letters only, at least 2 characters.)")
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
            session['name']  = user
            return redirect('books')
        return redirect('/')

    def process_login(self):
        user = self.models['Book'].login_user(request.form)
        if user:
            session['id'],session['name']  = user
            return redirect('books')
        flash( "Wrong email and/or password.")
        return redirect('/')

    def process_logout(self):
        del session['id']
        del session['name']
        del session['form']
        del session['form2']
        return redirect('/')

    def books_add(self):
        items = self.models['Book'].get_data()

        return self.load_view('books/add.html', items=items[2])

    def process_add(self):
        self.models['Book'].add_book(request.form)
        if False:
            return redirect('books/add')
        return redirect('books')

    def reviews_delete(self, item_id):
        self.models['Book'].delete_review(item_id)
        return redirect('books')