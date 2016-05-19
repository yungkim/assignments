from system.core.controller import *

class Posts(Controller):
    def __init__(self, action):
        super(Posts, self).__init__(action)
        self.load_model('Post')
        self.db = self._app.db
   
    def index(self):
        memos = self.models['Post'].all()
        return self.load_view('index.html', memos=memos)

    def index_json(self):
        memos = self.models['Post'].all()
        return jsonify(memos=memos)

    def create_posts(self): # form is posted
        note = request.form['description']
        if note == "":
            return redirect('/')
        return redirect('/notes/create/'+note)

    def create_notes(self, note): # add note to databse
        self.models['Post'].add_post(note)
        return redirect('/')