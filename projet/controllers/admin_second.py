from flask import jsonify, redirect, render_template, request, url_for
from projet import app
from projet.models.categorie import CategorieModel
from projet.models.classement import Classement_coureur, Classement_equipe
from projet.models.coureur import CoureurModel
from projet.models.equipe import EquipeModel
from projet.models.etape import EtapeModel
from projet.models.etape_coureur import Etape_coureurModel
from projet.models.participation import ParticipationModel
from projet.models.penalite import PenaliteModel, V_penalite
from projet.models.point import PointModel
from projet.services.export import get_pdf
from projet.services.init_data import delete_all_data
from projet.models.categorie_coureur import Categorie_coureurModel
from projet.services.service_resultat import genererCategorie


@app.route('/login-admin', methods = ['GET'])
def login_admin():
    return render_template("login-admin.html")

@app.route('/liste-etape-ad', methods = ['GET'])
def liste_etape2():
    etape = EtapeModel.find_all()
    return render_template("admin/list-etapead.html", etape = etape)

@app.route('/coureur-temps' , methods = ['GET'])
def coureur_temps():
    etape = EtapeModel.find_all()
    coureur = CoureurModel.find_all()
    return render_template("admin/coureur-temps.html", etape = etape, coureur = coureur)

@app.route('/print_chrono',methods=['POST'])
def printchrono():
    chrono = request.form['chrono']
    return {'response': chrono}

@app.route('/classement-equipe-ad' , methods = ['GET'])
def classment_eq():
    all_etapes = EtapeModel.find_all()
    all_cate = CategorieModel.find_all()
    col  = getattr(Classement_equipe,'point')
    cl = Classement_equipe.query.filter_by(idetape=0,idcategorie=0).order_by(col.desc()).all()
    return render_template("admin/classement-equipe.html",etape=all_etapes,cate=all_cate,cl=cl)

@app.route('/classement-etape-ad/<int:id>' , methods = ['GET'])
def classment_etape(id = 0):
    all_etapes = EtapeModel.find_all()
    for a in all_etapes:
        a.setMe(id)
    all_cate = CategorieModel.find_all()
    col  = getattr(Classement_coureur,'rang')
    cl = Classement_coureur.query.filter_by(idetape=id,idcategorie=0).order_by(col.asc()).all()
    return render_template("admin/classement-etape.html",etape=all_etapes,cate=all_cate,cl=cl)

@app.route('/detail/<int:id>' , methods = ['GET'])
def detail(id):
    col  = getattr(Classement_coureur,'rang')
    cl = Classement_coureur.query.filter(
        Classement_coureur.idetape!=0,
            Classement_coureur.idcategorie == 0,
            Classement_coureur.idequipe == id
    ).order_by(col.asc()).all()
    return render_template("admin/detail.html",cl=cl)


@app.route('/admin-home' , methods = ['GET','POST'])
def admin_home():
    return redirect(url_for('liste_etape2'))

@app.route('/import-first', methods =['GET'])
def import_first():
    return render_template("admin/import-first.html")

@app.route('/import-second', methods =['GET'])
def import_second():
    return render_template("admin/import-second.html")

@app.route('/generer-categorie', methods =['GET'])
def generer_categorie():
    genererCategorie()
    return redirect(url_for('classment_eq'))

@app.route('/delete-all', methods =['GET'])
def delete_all():
    delete_all_data(ParticipationModel,PointModel,Etape_coureurModel,Categorie_coureurModel,PenaliteModel,EtapeModel,CoureurModel,EquipeModel)
    return redirect(url_for('liste_etape2'))


@app.route('/export-pdf/<int:id>', methods = ['POST','GET'])
def export_pdf(id):
    resp = get_pdf(id)
    headers = {
        'content-type': 'application.pdf',
        'content-disposition': 'attachment  ; filename=certificat.pdf'}
    return resp, 200, headers


@app.route('/list-penalite', methods =['GET'])
def list_penalite():
    penalites = V_penalite.query.all()
    return render_template("admin/list-penalite.html", penalites = penalites)

@app.route('/add-penalite', methods =['GET'])
def add_penalite():
    all_etapes = EtapeModel.find_all()
    all_equipe = EquipeModel.find_all()
    return render_template("admin/ajout-penalite.html",etape=all_etapes,equipe=all_equipe)