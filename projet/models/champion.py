from projet.db import db

class Champion(db.Model):
    __tablename__ = 'champion'
    
    id = db.Column(db.Integer, primary_key=True)
    idcategorie = db.Column(db.Integer)
    idequipe = db.Column(db.Integer)
    nom = db.Column(db.String)
    nomequipe = db.Column(db.String)
    point = db.Column(db.Float)