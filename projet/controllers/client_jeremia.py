from projet import app
from flask import session, redirect, url_for,render_template,request
from projet.services.service_equipe import add_etape_coureurs
from projet.services.service_resultat import add_resultat_etape
from projet.annotation.authentication import auth


@app.route('/etape-coureur', methods = ['POST'])
@auth('USER')
def form_etape_coureur():
    idetape = request.form.get('idetape')
    # idetape = 1
    idcoureurs = set(request.form.getlist('idcoureur'))
    idcoureurs = [int(idcoureur) for idcoureur in idcoureurs]
    add_etape_coureurs(idetape, idcoureurs)
    return redirect(url_for('liste_etape'))

@app.route('/resultat-etape', methods = ['POST'])
def form_resultat_etape():
    idetape = request.form.get('idetape')
    idcoureur = request.form.get('idcoureur')
    heure = request.form.get('heure')
    add_resultat_etape(idetape, idcoureur, heure)
    return redirect(url_for('liste_etape2'))

