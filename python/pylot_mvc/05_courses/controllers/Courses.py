from system.core.controller import *

class Courses(Controller):
    def __init__(self, action):
        super(Courses, self).__init__(action)
        self.load_model('Course')
        self.db = self._app.db
   
    def index(self):
        all_course = self.models['Course'].get_all_courses()
        return self.load_view('index.html', all_course=all_course)

    def show(self, id):
        course = self.models['Course'].get_course_by_id(id)
        return self.load_view('show.html', course=course)

    def add(self):
        course_details = {
            'title': request.form['title'],
            'description': request.form['description']
        }
        self.models['Course'].add_course(course_details)
        return redirect('/')

    def update(self, course_id):
        course_details = {
            'id': course_id,
            'title': 'Python 2.0',
            'description': 'This course is unreal!'
        }
        self.models['Course'].update_course(course_details)
        return redirect('/')

    def delete(self, course_id):
        self.models['Course'].delete_course(course_id)
        return redirect('/')

    def delete_confirm(self, course_id):
        course_to_delete = self.models['Course'].get_course_by_id(course_id)
        print course_to_delete
        return self.load_view('confirm.html', course_to_delete=course_to_delete)

