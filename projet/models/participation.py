from projet.db import db

class ParticipationModel(db.Model):
    __tablename__ = 'participation'
    
    idparticipation = db.Column(db.Integer, primary_key=True)
    idcoureur = db.Column(db.Integer, db.ForeignKey('coureur.idcoureur'))
    idetape = db.Column(db.Integer, db.ForeignKey('etape.idetape'))
    arrive = db.Column(db.DateTime)
    

    def __init__(self, idetape, idcoureur, arrive):
        self.idetape = idetape
        self.idcoureur = idcoureur
        self.arrive = arrive

    def json(self):
        return {
            'idparticipation' : self.idparticipation,
            'idetape':self.idetape,
            'idcoureur': self.idcoureur,
            'arrive':self.arrive.isoformat() if self.arrive else None
        }

    @classmethod
    def find_by_id(cls, id):
        return cls.query.filter_by(idparticipation=id).all()

    @classmethod
    def find_all(cls):
        return cls.query.all()
    
    def save_to_db(self):
        db.session.add(self)
        db.session.commit()

    def delete_from_db(self):
        db.session.delete(self)
        db.session.commit()
