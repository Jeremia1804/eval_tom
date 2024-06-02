from projet.db import db
from werkzeug.security import hmac

class EquipeModel(db.Model):
    __tablename__ = 'equipe'
    
    idequipe = db.Column(db.Integer, primary_key=True)
    nom = db.Column(db.String(50), unique=True)
    login = db.Column(db.String(50))
    pwd = db.Column(db.String(80))
    

    def __init__(self, nom,login,pwd):
        self.login = login
        self.nom = nom
        self.pwd = pwd

    def json(self):
        return {
            'idequipe' : self.idequipe,
            'nom':self.nom,
            'login':self.login,
            'pwd':self.pwd
        }

    @classmethod
    def find_by_id(cls, id):
        return cls.query.filter_by(idequipe=id).all()

    @classmethod
    def find_all(cls):
        return cls.query.all()
    
    def save_to_db(self):
        db.session.add(self)
        db.session.commit()

    def delete_from_db(self):
        db.session.delete(self)
        db.session.commit()

    def check_pwd(self, pwd):
        return hmac.compare_digest(self.pwd, pwd)

    @classmethod
    def find_by_login(cls, login):
        return cls.query.filter_by(login=login).first()
