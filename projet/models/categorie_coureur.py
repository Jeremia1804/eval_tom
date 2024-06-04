from projet.db import db

class Categorie_coureurModel(db.Model):
    __tablename__ = 'categorie_coureur'
    
    idcategorie_coureur = db.Column(db.Integer, primary_key=True)
    idcategorie = db.Column(db.Integer, db.ForeignKey('categorie.idcategorie'))
    idcoureur = db.Column(db.Integer, db.ForeignKey('coureur.idcoureur'))