from datetime import datetime
from projet.models.participation import ParticipationModel
from projet.db import db
from sqlalchemy import text

def add_resultat_etape(idetape,idcoureur,heure):
    idetape = int(idetape)
    idcoureur = int(idcoureur)
    h = heure.split('T')[1].split(':')
    if len(h) == 2:
        heure = heure + ':00'
    heure = datetime.strptime(heure, '%Y-%m-%dT%H:%M:%S')
    mod = ParticipationModel(idetape, idcoureur, heure)
    mod.save_to_db()

def genererCategorie():
    db.session.execute(text("insert into categorie_coureur (idcoureur,idcategorie) select v.idcoureur,v.idcategorie from v_catego_coureur v left join categorie_coureur c on c.idcoureur = v.idcoureur and c.idcategorie = v.idcategorie where c.idcategorie_coureur is null"))
    db.session.commit()