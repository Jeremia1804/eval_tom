from projet.db import db

class Classement_equipe(db.Model):
    __tablename__ = 'classement_equipe'
    
    rang = db.Column(db.Integer, primary_key=True)
    idetape = db.Column(db.Integer)
    idcategorie = db.Column(db.Integer)
    idequipe = db.Column(db.Integer)
    nomequipe = db.Column(db.String)
    point = db.Column(db.Float)

    def json(self):
        return {
            'nomequipe': self.nomequipe,
            'point': self.point,
        }


class Classement_coureur(db.Model):
    __tablename__ = 'classement_coureur'
    
    id = db.Column(db.Integer, primary_key=True)
    rang = db.Column(db.Integer)
    idetape = db.Column(db.Integer)
    idcategorie = db.Column(db.Integer)
    idequipe = db.Column(db.Integer)
    idcoureur = db.Column(db.Integer)
    nom = db.Column(db.String)
    numero = db.Column(db.Integer)
    nomequipe = db.Column(db.String)
    duree_formatted = db.Column(db.String)
    duree_seconde = db.Column(db.String)
    point = db.Column(db.Float)

    def json(self):
        duree_formatted = str(self.duree_formatted) if self.duree_formatted else ""
        return {
            'rang': self.rang,
            'nom': self.nom,
            'numero': self.numero,
            'nomequipe': self.nomequipe,
            'duree_formatted': duree_formatted,
            'point': self.point,
        }

