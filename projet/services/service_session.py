from flask import session
from projet.models.admin import AdminModel
from projet.models.equipe import EquipeModel

def getMyId():
    return session['user'].get('id')

def connexionAdmin(login,pwd):
    admin = AdminModel.query.filter_by(login=login).one_or_none()
    if not admin or not admin.check_pwd(pwd):
        return False
    setSession('ADMIN', 0,'admin')
    return True

def connexionEquipe(login,pwd):
    equipe = EquipeModel.query.filter_by(login=login).one_or_none()
    if not equipe or not equipe.check_pwd(pwd):
        return False
    setSession('USER',equipe.idequipe, equipe.nom)
    return True


def setSession(role,id, nom):
    session['user'] = {'id': id,'nom': nom, 'roles': [role]}