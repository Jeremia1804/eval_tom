from flask import redirect, render_template, url_for
from projet import app
from projet.models.coureur import CoureurModel
from projet.services.service_session import getMyId

@app.route('/', methods = ['GET'])
def index():
    return redirect(url_for('login_equipe'))

@app.route('/login-equipe', methods = ['GET'])
def login_equipe():
    return render_template("login-equipe.html")

@app.route('/liste-etape', methods = ['GET'])
def liste_etape():
    return render_template("client/list-etape.html")

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