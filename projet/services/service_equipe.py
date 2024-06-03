
from projet.models.etape_coureur import Etape_coureurModel
from projet.db import db
from projet.services.service_session import getMyId 
from projet.models.etape_coureur import V_etape_coureurModel
from projet.models.etape import EtapeModel

def add_etape_coureurs(idetape, idcoureurs):
    idequipe = getMyId()
    idetape = int(idetape)
    try:
        mescoureurs = V_etape_coureurModel.query.filter_by(idetape=idetape,idequipe=idequipe).all()
        etape = EtapeModel.find_by_id(idetape)

        verification(mescoureurs, etape, idcoureurs)
        for idcoureur in idcoureurs:
            add_etape_coureur(idetape, idcoureur)
        db.session.commit()
    except Exception as e:
        raise e

def add_etape_coureur(idetape,idcoureur):
    mod = Etape_coureurModel(idetape, idcoureur)
    mod.save_to_db()

def verification(mescoureurs,etape,idcoureurs):
    if mescoureurs:
        print(etape)
        nombre_etape = etape.nombre_coureur
        nombre_entree  = len(idcoureurs)
        nombre_misy = len(mescoureurs)
        reste = nombre_etape - nombre_misy
        if reste <= 0:
            raise Exception('Nombre limite, vous ne pouvez plus ajouter de coureur')
        if reste<nombre_entree:
            raise Exception(f'Nombre trop grande, il ne vous reste plus que {reste} coureurs pour cette etape')
        for cour in mescoureurs:
            if cour.idcoureur in idcoureurs:
                raise Exception(f'le joueur avec id: {cour.idcoureur} est deja enregistre')