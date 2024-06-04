from projet import app
from flask import session, redirect, url_for,render_template,request
from projet.services.service_import import importer_point, upload, importer_etape_resultat
from projet.services.service_penalite import penaliser, drop_penalite
from projet.models.penalite import V_penalite

@app.route('/import-point', methods = ['POST'])
def import_point():
    if 'fichier' not in request.files:
        return {'message':'Fichier manquant'}
    file = request.files['fichier']
    filename = upload(file)
    importer_point(filename)
    return render_template("admin/classement-equipe.html")


@app.route('/import-etape-resultat', methods = ['POST'])
def import_etape_resultat():
    if 'etape' not in request.files or 'resultat' not in request.files:
        return {'message':'Fichier manquant'}
    file_etape = request.files['etape']
    file_resultat = request.files['resultat']
    filename_etape = upload(file_etape)
    filename_resultat = upload(file_resultat)
    importer_etape_resultat(filename_etape,filename_resultat)
    return render_template("admin/classement-equipe.html")

@app.route('/penalite', methods = ['POST'])
def insert_penalite():
    idetape = request.form.get('idetape')
    idequipe = request.form.get('idequipe')
    chrono = request.form.get('penalite')
    penaliser(idequipe, idetape,chrono)
    return "cool", 200

@app.route('/delete-penalite/<int:id>', methods = ['POST','GET','DELETE'])
def delete_penalite(id):
    drop_penalite(id)
    return "cool", 200
