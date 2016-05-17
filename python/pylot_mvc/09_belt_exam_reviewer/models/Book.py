from system.core.model import Model
import re
EMAIL_REGEX = re.compile(r'^[a-zA-Z0-9\.\+_-]+@[a-zA-Z0-9\._-]+\.[a-zA-Z]*$')
NAME_REGEX = re.compile(r'^[a-zA-Z ]+$') # Case insensitive "a" to "z" and "space" allowed
PASSWORD_REGEX = re.compile(r'^([^0-9]*|[^A-Z]*)$') # number and upper case letter allowed

class Book(Model):
    def __init__(self):
        super(Book, self).__init__()

    def register_user(self, info):
        if len(info['name']) < 2 or not NAME_REGEX.match(info['name']):
            return "err1"
        elif len(info['alias']) < 2 or not NAME_REGEX.match(info['alias']):
            return "err2"
        elif len(info['email']) < 1 or not EMAIL_REGEX.match(info['email']):
            return "err3"
        elif self.db.query_db("SELECT * FROM users WHERE email = '"+info['email']+"'") != [] :
            return "err4"
        elif len(info['password']) < 8:
            return "err5"
        elif info['password'] != info['confirm_password']:
            return "err6"
        elif PASSWORD_REGEX.match(info['confirm_password']):
            return "err7"
        else:
            pw_hash = self.bcrypt.generate_password_hash(info['password'])
            user_query = "INSERT INTO users (name, alias, email, pw_hash, created_at, updated_at) VALUES (:name, :alias, :email, :pw_hash, NOW(), NOW())"
            user_data = {
                'name': info['name'],
                'alias': info['alias'],
                'email': info['email'],
                'pw_hash': pw_hash
                }
            user = self.db.query_db(user_query, user_data)
            return (info['name'])

    def login_user(self, info):
        user_query = "SELECT * FROM users WHERE email = :email LIMIT 1"
        user_data = {'email': info['email']}
        user = self.db.query_db(user_query, user_data)
        if len(info['password']) < 8 or not EMAIL_REGEX.match(info['email']) or user == [] or not self.bcrypt.check_password_hash(user[0]['pw_hash'], info['password']):
            message = "Wrong email and/or password." # login fails with all these if conditions
            return False
        else:
            return  (user[0]['id'], user[0]['name'])

    def get_data(self):
        data_query = "SELECT *, reviews.id as r_id, reviews.created_at as r_created_at from users left join reviews on users.id = reviews.user_id left join books ON books.id = reviews.book_id ORDER BY reviews.created_at DESC LIMIT 3;"
        data = self.db.query_db(data_query)
        random = self.db.query_db("SELECT DISTINCT(title), id from books ORDER BY RAND()")
        author = self.db.query_db("SELECT DISTINCT(author) from books ORDER BY author;")
        return (data, random, author) # 'random' is used for displaying 'Other Books with Reviews' in random order

    def get_book_by_id(self, item_id):
        data_query = "SELECT *, reviews.id as r_id, reviews.created_at as r_created_at from users join reviews on users.id = reviews.user_id join books ON books.id = reviews.book_id WHERE books.id = ' " + item_id + "';"
        data = self.db.query_db(data_query)
        return data

    def get_user_by_id(self, item_id):
        data_query = "SELECT * from users join reviews on users.id = reviews.user_id join books ON books.id = reviews.book_id WHERE users.id = ' " + item_id + "';"
        data = self.db.query_db(data_query)
        count = self.db.query_db("SELECT COUNT(*) from users join reviews on users.id = reviews.user_id join books ON books.id = reviews.book_id WHERE users.id = ' " + item_id + "';")
        return (data, count)

    def add_book(self, book):
        if book["title"] == "" or book["author"] == "" or book["review"] == "": # do not add if content is empty
            return False
        # Check if a book already rexists in database with exactly same title and author.
        check_existing = "SELECT * FROM books WHERE title = :title and author= :author"
        title_to_check = {'title':book['title'], 'author':book['author']}
        exist = self.db.query_db(check_existing, title_to_check)
        if exist != []:
            book_id = exist[0]['id'] # add a review under an existing book
        elif exist == []: # add a review under a newly created book
            user_query = "INSERT INTO books (title, author, created_at, updated_at) VALUES (:title, :author, NOW(), NOW())"
            user_data = {
                'title': book['title'],
                'author': book['author']
                }
            user = self.db.query_db(user_query, user_data)
            get_id = self.db.query_db("SELECT * FROM books ORDER BY created_at DESC;")
            book_id = get_id[0]['id']
        user_query = "INSERT INTO reviews (user_id, book_id, review, rating, created_at, updated_at) VALUES (:user_id, :book_id, :review, :rating, NOW(), NOW())"
        user_data = {
            'user_id': book['id'],
            'book_id': book_id,
            'review': book['review'],
            'rating': book['rating']
            }
        user = self.db.query_db(user_query, user_data)

    def delete_review(self, item_id):
        self.db.query_db("DELETE FROM reviews WHERE id = " + item_id)
