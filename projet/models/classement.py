from projet.db import db

class Classement_equipe(db.Model):
    __tablename__ = 'classement_equipe'
    
    rang = db.Column(db.Integer, primary_key=True)
    idetape = db.Column(db.Integer)
    idcategorie = db.Column(db.Integer)
    idequipe = db.Column(db.Integer)
    nomequipe = db.Column(db.String)
    point = db.Column(db.Float)
    penalite = db.Column(db.String)
    penalite_formatted = db.Column(db.String)

    def json(self):
        return {
            'nomequipe': self.nomequipe,
            'point': self.point,
            'penalite':self.penalite,
            'penalite_formatted':str(self.penalite_formatted)
        }


class Classement_coureur(db.Model):
    __tablename__ = 'classement_coureur'
    
    id = db.Column(db.Integer, primary_key=True)
    rang = db.Column(db.Integer)
    idetape = db.Column(db.Integer)
    idcategorie = db.Column(db.Integer)
    idequipe = db.Column(db.Integer)
    idcoureur = db.Column(db.Integer, db.ForeignKey('coureur.idcoureur'))
    nom = db.Column(db.String)
    numero = db.Column(db.Integer)
    nomequipe = db.Column(db.String)
    duree_formatted = db.Column(db.String)
    pen_formatted = db.Column(db.String)
    new_duree_formatted = db.Column(db.String)
    duree_seconde = db.Column(db.String)
    point = db.Column(db.Float)

    coureur  = db.relationship('CoureurModel')

    def json(self):
        duree_formatted = str(self.duree_formatted) if self.duree_formatted else ""
        return {
            'rang': self.rang,
            'nom': self.nom,
            'numero': self.numero,
            'genre':self.coureur.genre,
            'nomequipe': self.nomequipe,
            'duree_formatted': duree_formatted,
            'pen_formatted': str(self.pen_formatted),
            'point': self.point,
            'new_duree_formatted':str(self.new_duree_formatted)
        }

