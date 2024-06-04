from projet.models.penalite import PenaliteModel

def penaliser(idequipe,idetape,chrono):
    hms = chrono.split(':')
    hms = [int(valeur) for valeur in hms]
    secondes = hms[0] * 3600 + hms[1] * 60 + hms[2]
    penalite = PenaliteModel(idetape,idequipe,secondes)
    penalite.save_to_db()

def drop_penalite(idpenalite):
    penalite = PenaliteModel.find_by_id(idpenalite)
    penalite.delete_from_db()