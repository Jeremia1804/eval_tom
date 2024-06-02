from projet.db import db

class PenaliteModel(db.Model):
    __tablename__ = 'penalite'
    
    idpenalite = db.Column(db.Integer, primary_key=True)
    idcoureur = db.Column(db.Integer, db.ForeignKey('coureur.idcoureur'))
    idetape = db.Column(db.Integer, db.ForeignKey('etape.idetape'))
    penalite = db.Column(db.Float)
    

    def __init__(self, idetape, idcoureur, penalite):
        self.idetape = idetape
        self.idcoureur = idcoureur
        self.penalite = penalite

    def json(self):
        return {
            'idpenalite' : self.idpenalite,
            'idetape':self.idetape,
            'idcoureur': self.idcoureur,
            'penalite':self.penalite
        }

    @classmethod
    def find_by_id(cls, id):
        return cls.query.filter_by(idpenalite=id).all()

    @classmethod
    def find_all(cls):
        return cls.query.all()
    
    def save_to_db(self):
        db.session.add(self)
        db.session.commit()

    def delete_from_db(self):
        db.session.delete(self)
        db.session.commit()
