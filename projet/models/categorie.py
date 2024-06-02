from projet.db import db
from werkzeug.security import hmac

class CategorieModel(db.Model):
    __tablename__ = 'categorie'
    
    idcategorie = db.Column(db.Integer, primary_key=True)
    nom = db.Column(db.String(50), unique=True)
    

    def __init__(self, nom):
        self.nom = nom

    def json(self):
        return {
            'idcategorie' : self.idcategorie,
            'nom':self.nom
        }

    @classmethod
    def find_by_id(cls, id):
        return cls.query.filter_by(idcategorie=id).all()

    @classmethod
    def find_all(cls):
        return cls.query.all()
    
    def save_to_db(self):
        db.session.add(self)
        db.session.commit()

    def delete_from_db(self):
        db.session.delete(self)
        db.session.commit()
