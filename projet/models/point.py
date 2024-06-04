from projet.db import db

class PointModel(db.Model):
    __tablename__ = 'point'
    
    idpoint = db.Column(db.Integer, primary_key=True)
    classement = db.Column(db.Integer)
    valeur = db.Column(db.Integer)

    def __init__(self, classement, valeur):
        self.classement = classement
        self.valeur = valeur

    def save_to_db(self):
        db.session.add(self)