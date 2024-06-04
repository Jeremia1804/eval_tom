from projet.db import db

class PenaliteModel(db.Model):
    __tablename__ = 'penalite'
    
    idpenalite = db.Column(db.Integer, primary_key=True)
    idequipe = db.Column(db.Integer, db.ForeignKey('equipe.idequipe'))
    idetape = db.Column(db.Integer, db.ForeignKey('etape.idetape'))
    penalite = db.Column(db.Float)
    

    def __init__(self, idetape, idequipe, penalite):
        self.idetape = idetape
        self.idequipe = idequipe
        self.penalite = penalite

    def json(self):
        return {
            'idpenalite' : self.idpenalite,
            'idetape':self.idetape,
            'idequipe': self.idequipe,
            'penalite':self.penalite
        }

    @classmethod
    def find_by_id(cls, id):
        return cls.query.filter_by(idpenalite=id).first()

    @classmethod
    def find_all(cls):
        return cls.query.all()
    
    def save_to_db(self):
        db.session.add(self)
        db.session.commit()

    def delete_from_db(self):
        db.session.delete(self)
        db.session.commit()

class V_penalite(db.Model):
    __tablename__ = 'v_penalite'
    
    idpenalite = db.Column(db.Integer, primary_key=True)
    nomequipe = db.Column(db.String)
    nometape = db.Column(db.String)
    chrono = db.Column(db.Time)
    penalite = db.Column(db.Float)
