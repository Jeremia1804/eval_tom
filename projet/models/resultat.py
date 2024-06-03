from projet.db import db

class ResultatModel(db.Model):
    __tablename__ = 'resultat'
    
    idetape_coureur = db.Column(db.Integer, primary_key=True)
    idetape = db.Column(db.Integer)
    idcoureur = db.Column(db.Integer)
    idequipe = db.Column(db.Integer)
    nom = db.Column(db.String(50))
    numero = db.Column(db.Integer)
    duree_formatted = db.Column(db.String)
    duree_seconde = db.Column(db.Float)

    @classmethod
    def find_by_equipe_etape(cls, idetape, idequipe):
        tri_col = 'duree_seconde'
        colonne_tri = getattr(ResultatModel, tri_col)
        return cls.query.filter_by(idequipe=idequipe, idetape = idetape).order_by(colonne_tri.asc()).all()