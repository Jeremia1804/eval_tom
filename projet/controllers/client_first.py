from projet import app
from flask import session, redirect, url_for,render_template,request
from projet.services.service_equipe import add_etape_coureurs
from projet.services.service_resultat import add_resultat_etape
from projet.annotation.authentication import auth
from projet.models.resultat import ResultatModel
from projet.models.classement import Classement_coureur, Classement_equipe

@app.route('/etape-coureur/<int:id>', methods = ['POST'])
@auth('USER')
def form_etape_coureur(id):
    idetape = id
    idcoureurs = set(request.form.getlist('idcoureur'))
    idcoureurs = [int(idcoureur) for idcoureur in idcoureurs]
    add_etape_coureurs(idetape, idcoureurs)
    return {'message':'Good'}, 200

@app.route('/resultat-etape', methods = ['POST'])
def form_resultat_etape():
    idetape = request.form.get('idetape')
    idcoureur = request.form.get('idcoureur')
    heure = request.form.get('heure')
    add_resultat_etape(idetape, idcoureur, heure)
    return redirect(url_for('liste_etape2'))

@app.route('/test', methods = ['GET'])
def test():
    result = Classement_coureur.query.all()
    for r in result:
        print(r.idcoureur)
    return "cool", 200