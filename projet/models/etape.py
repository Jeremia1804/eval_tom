from projet.db import db
from werkzeug.security import hmac

class EtapeModel(db.Model):
    __tablename__ = 'etape'
    
    idetape = db.Column(db.Integer, primary_key=True)
    nom = db.Column(db.String(50))
    rang = db.Column(db.Integer)
    nombre_coureur = db.Column(db.Integer)
    longueur = db.Column(db.Float)
    debut = db.Column(db.DateTime)
    

    def __init__(self, nom, rang,nombre_coureur, longueur, debut):
        self.nom = nom
        self.rang = rang
        self.nombre_coureur = nombre_coureur
        self.longueur = longueur
        self.debut = debut

    def json(self):
        return {
            'idetape' : self.idetape,
            'nom':self.nom,
            'rang': self.rang,
            'nombre_coureur': self.nombre_coureur,
            'longueur':self.longueur,
            'debut':self.debut.isoformat() if self.debut else None
        }

    @classmethod
    def find_by_id(cls, id):
        return cls.query.filter_by(idetape=id).one_or_none()

    @classmethod
    def find_all(cls):
        return cls.query.all()
    
    def save_to_db(self):
        db.session.add(self)
        db.session.commit()

    def delete_from_db(self):
        db.session.delete(self)
        db.session.commit()
