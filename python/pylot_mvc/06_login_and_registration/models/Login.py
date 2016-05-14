from system.core.model import Model
import re
EMAIL_REGEX = re.compile(r'^[a-zA-Z0-9\.\+_-]+@[a-zA-Z0-9\._-]+\.[a-zA-Z]*$')
NAME_REGEX = re.compile(r'^[a-zA-Z ]+$') # Case insensitive "a" to "z" and "space" allowed
PASSWORD_REGEX = re.compile(r'^([^0-9]*|[^A-Z]*)$') # number and upper case letter allowed

class Login(Model):
    def __init__(self):
        super(Login, self).__init__()

    def register_user(self, info):
        if len(info['fname']) < 2 or not NAME_REGEX.match(info['fname']):
            return "err1"
        elif len(info['lname']) < 2 or not NAME_REGEX.match(info['lname']):
            return "err2"
        elif len(info['email']) < 1 or not EMAIL_REGEX.match(info['email']):
            return "err3"
        elif self.db.query_db("SELECT * FROM users WHERE email = '"+info['email']+"'") != [] :
            return "err4"
        elif len(info['password']) < 8:
            return "err5"
        elif info['password'] != info['cpassword']:
            return "err6"
        elif PASSWORD_REGEX.match(info['cpassword']):
            return "err7"
        else:
            pw_hash = self.bcrypt.generate_password_hash(info['password'])
            user_query = "INSERT INTO users (first_name, last_name, email, pw_hash, created_at, updated_at) VALUES (:first_name, :last_name, :email, :pw_hash, NOW(), NOW())"
            user_data = {
                'first_name': info['fname'],
                'last_name': info['lname'],
                'email': info['email'],
                'pw_hash': pw_hash
                }
            user = self.db.query_db(user_query, user_data)
            return (info['fname'])

    def login_user(self, info):
        user_query = "SELECT * FROM users WHERE email = :email LIMIT 1"
        user_data = {'email': info['email']}
        user = self.db.query_db(user_query, user_data)
        if len(info['password']) < 8 or not EMAIL_REGEX.match(info['email']) or user == [] or not self.bcrypt.check_password_hash(user[0]['pw_hash'], info['password']):
            message = "Wrong email and/or password." # login fails with all these if conditions
            return False
        else:
            return  (user[0]['id'], user[0]['first_name'])


