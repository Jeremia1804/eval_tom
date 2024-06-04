from projet import app
from flask import session, redirect, url_for,render_template,request
from projet.services.service_import import importer_point, upload, importer_etape_resultat

@app.route('/import-point', methods = ['POST'])
def import_point():
    if 'fichier' not in request.files:
        return {'message':'Fichier manquant'}
    file = request.files['fichier']
    filename = upload(file)
    importer_point(filename)
    return 'milamina ee', 200


@app.route('/import-etape-resultat', methods = ['POST'])
def import_etape_resultat():
    if 'etape' not in request.files or 'resultat' not in request.files:
        return {'message':'Fichier manquant'}
    file_etape = request.files['etape']
    file_resultat = request.files['resultat']
    filename_etape = upload(file_etape)
    filename_resultat = upload(file_resultat)
    importer_etape_resultat(filename_etape,filename_resultat)
    return 'milamina ee', 200