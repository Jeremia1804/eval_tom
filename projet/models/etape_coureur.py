from projet.db import db

class Etape_coureurModel(db.Model):
    __tablename__ = 'etape_coureur'
    
    idetape_coureur = db.Column(db.Integer, primary_key=True)
    idetape = db.Column(db.Integer, db.ForeignKey('etape.idetape'))
    idcoureur = db.Column(db.Integer, db.ForeignKey('coureur.idcoureur'))
    
    
    def __init__(self, idetape,idcoureur):
        self.idcoureur = idcoureur
        self.idetape = idetape

    @classmethod
    def find_by_id(cls, id):
        return cls.query.filter_by(idetape_coureur=id).all()

    @classmethod
    def find_all(cls):
        return cls.query.all()
    
    def save_to_db(self):
        db.session.add(self)
        # db.session.commit()

    def delete_from_db(self):
        db.session.delete(self)
        db.session.commit()
