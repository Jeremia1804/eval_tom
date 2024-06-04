from flask import redirect, render_template, request, url_for
from projet import app
from projet.models.categorie import CategorieModel
from projet.models.classement import Classement_coureur, Classement_equipe
from projet.models.coureur import CoureurModel
from projet.models.equipe import EquipeModel
from projet.models.etape import EtapeModel
from projet.models.etape_coureur import Etape_coureurModel
from projet.models.participation import ParticipationModel
from projet.models.point import PointModel
from projet.services.init_data import delete_all_data


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
    return render_template("client/classement-equipe.html",etape=all_etapes,cate=all_cate,cl=cl)

@app.route('/classement-etape-ad' , methods = ['GET'])
def classment_etape():
    all_etapes = EtapeModel.find_all()
    all_cate = CategorieModel.find_all()
    col  = getattr(Classement_coureur,'rang')
    cl = Classement_coureur.query.filter_by(idetape=0,idcategorie=0).order_by(col.asc()).all()
    return render_template("client/classement-etape.html",etape=all_etapes,cate=all_cate,cl=cl)

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
    return {'message': 'generer-na'}

@app.route('/delete-all', methods =['GET'])
def delete_all():
    delete_all_data(ParticipationModel,PointModel,Etape_coureurModel,EtapeModel,CoureurModel,CategorieModel,EquipeModel)
    return {'message': 'fafa-na'}