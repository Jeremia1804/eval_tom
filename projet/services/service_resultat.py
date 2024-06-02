from datetime import datetime
from projet.models.participation import ParticipationModel
from projet.db import db


def add_resultat_etape(idetape,idcoureur,heure):
    idetape = int(idetape)
    idcoureur = int(idcoureur)
    heure = datetime.strptime(heure, '%Y-%m-%dT%H:%M:%S')
    mod = ParticipationModel(idetape, idcoureur, heure)
    mod.save_to_db()