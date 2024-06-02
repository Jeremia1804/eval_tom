from projet.db import db
from werkzeug.security import hmac


class AdminModel(db.Model):
    __tablename__ = 'admin'

    id = db.Column(db.Integer, primary_key=True)
    login = db.Column(db.String(50))
    pwd = db.Column(db.String(80))

    def __init__(self, login, pwd):
        self.login = login
        self.pwd = pwd

    def save_to_db(self):
        db.session.add(self)
        db.session.commit()

    def check_pwd(self, pwd):
        return hmac.compare_digest(self.pwd, pwd)

    @classmethod
    def find_by_login(cls, login):
        return cls.query.filter_by(login=login).first()