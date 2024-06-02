
from projet.models.etape_coureur import Etape_coureurModel
from projet.db import db

def add_etape_coureurs(idetape, idcoureurs):
    idetape = int(idetape)
    for idcoureur in idcoureurs:
        id = int(idcoureur)
        add_etape_coureur(idetape, id)
    db.session.commit()

def add_etape_coureur(idetape,idcoureur):
    mod = Etape_coureurModel(idetape, idcoureur)
    mod.save_to_db()