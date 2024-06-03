from flask import redirect, render_template, url_for
from projet import app
from projet.annotation.authentication import auth
from projet.models.etape import EtapeModel
from projet.services.service_session import getMyId
from projet.models.coureur import CoureurModel
from projet.services.service_session import getMyId

@app.route('/', methods = ['GET'])
def index():
    return redirect(url_for('login_equipe'))

@app.route('/login-equipe', methods = ['GET'])
def login_equipe():
    return render_template("login-equipe.html")

@app.route('/liste-etape', methods = ['GET'])
@auth('USER')
def liste_etape():
    idequipe = getMyId()
    all_etapes = EtapeModel.find_all()
    for etape in all_etapes:
        etape.getMyResultEtapeByEquipe(idequipe)
    return render_template("client/list-etape.html" , etapes=all_etapes)

@app.route('/coureur-etape', methods =['GET'])
def coureur_etape():
    coureur = CoureurModel.find_by_id(getMyId())
    return render_template("client/coureur-etape.html", coureur = coureur)

@app.route('/classement-equipe' , methods = ['GET'])
def classment_eq_cl():
    return render_template("client/classement-equipe.html")

@app.route('/classement-etape' , methods = ['GET'])
def classment_etape_cl():
    return render_template("client/classement-etape.html")

@app.route('/equipe-home', methods=['GET','POST'])
def equipe_home():
    return redirect(url_for('liste_etape'))