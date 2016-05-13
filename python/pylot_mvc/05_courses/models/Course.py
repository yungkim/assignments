from system.core.model import Model

class Course(Model):
    def __init__(self):
        super(Course, self).__init__()

    def get_all_courses(self):
        return self.db.query_db("SELECT * FROM courses ORDER BY title")

    def get_course_by_id(self, course_id):
        query = "SELECT * FROM courses WHERE id = :course_id"
        data = { 'course_id': course_id }
        return self.db.query_db(query, data)

    def add_course(self, course):
      # Build the query first and then the data that goes in the query
      query = "INSERT INTO courses (title, description, created_at) VALUES (:title, :description, NOW())"
      data = { 'title': course['title'], 'description': course['description'] }
      return self.db.query_db(query, data)

    def update_course(self, course):
      # Building the query for the update
      query = "UPDATE courses SET title=:title, description=:description WHERE id = :course_id"
      # we need to pass the necessary data
      data = { 'title': course['title'], 'description': course['description'], 'course_id': course['id']}
      # run the update
      return self.db.query_db(query, data)

    def delete_course(self, course_id):
      query = "DELETE FROM courses WHERE id = :course_id"
      data = { "course_id": course_id }
      return self.db.query_db(query, data)