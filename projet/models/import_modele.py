from datetime import datetime
from projet.db import db

class ImportEtapeModel(db.Model):
    __tablename__ = 'import_etape'
    
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    etape = db.Column(db.String(50), nullable=False)
    longueur = db.Column(db.Float, nullable=False)
    nb_coureur = db.Column(db.Integer, nullable=False)
    rang = db.Column(db.Integer, nullable=False)
    date_depart = db.Column(db.Date, nullable=False)
    heure_depart = db.Column(db.Time, nullable=False)
    
    def __init__(self, etape, longueur, nb_coureur, rang, date_depart, heure_depart):
        self.etape = etape
        self.longueur = longueur
        self.nb_coureur = nb_coureur
        self.rang = rang
        self.date_depart = datetime.strptime(date_depart, "%d/%m/%Y").date()
        self.heure_depart = datetime.strptime(heure_depart, "%H:%M:%S").time()
    
    def save_to_db(self):
        db.session.add(self)


class ImportResultModel(db.Model):
    __tablename__ = 'import_resultat'
    
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    etape_rang = db.Column(db.Integer, nullable=False)
    numero_dossard = db.Column(db.Integer, nullable=False)
    nom = db.Column(db.String(50), nullable=False)
    genre = db.Column(db.String(1), nullable=False)
    date_naissance = db.Column(db.Date, nullable=False)
    equipe = db.Column(db.String(50), nullable=False)
    arrivee = db.Column(db.DateTime, nullable=False)
    
    def __init__(self, etape_rang, numero_dossard, nom, genre, date_naissance, equipe, arrivee):
        self.etape_rang = etape_rang
        self.numero_dossard = numero_dossard
        self.nom = nom
        self.genre = genre
        self.date_naissance = datetime.strptime(date_naissance, "%d/%m/%Y").date()
        self.equipe = equipe
        self.arrivee = datetime.strptime(arrivee, "%d/%m/%Y %H:%M:%S")

    def save_to_db(self):
        db.session.add(self)