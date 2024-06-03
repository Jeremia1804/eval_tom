from projet.db import db
from werkzeug.security import hmac

class CoureurModel(db.Model):
    __tablename__ = 'coureur'
    
    idcoureur = db.Column(db.Integer, primary_key=True)
    nom = db.Column(db.String(50))
    numero = db.Column(db.Integer)
    genre = db.Column(db.String(10))
    dtn = db.Column(db.Date)
    idequipe = db.Column(db.Integer, db.ForeignKey('equipe.idequipe'))
    

    def __init__(self, nom, numero,genre, dtn, idequipe):
        self.nom = nom
        self.numero = numero
        self.genre = genre
        self.dtn = dtn
        self.idequipe = idequipe

    def json(self):
        return {
            'idcoureur' : self.idcoureur,
            'nom':self.nom,
            'numero': self.numero,
            'genre': self.genre,
            'dtn':self.dtn,
            'idequipe':self.idequipe
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
