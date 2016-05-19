from system.core.model import Model

class Post(Model):
    def __init__(self):
        super(Post, self).__init__()
        
    def all(self):
        query = "SELECT * FROM memos ORDER by created_at DESC LIMIT 6"
        return self.db.query_db(query)

    def add_post(self, req):
        sql = "INSERT into memos (description, created_at, updated_at) VALUES (:description, NOW(), NOW())"
        req = { 'description': req }
        self.db.query_db(sql, req)