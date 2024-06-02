from projet import app
from flask import session, redirect, url_for,render_template,request
from projet.services.service_session import connexionAdmin, connexionEquipe

@app.route('/equipe/signin', methods = ['POST'])
def connexclient():
    email = request.form['email']
    password = request.form['password']
    if connexionEquipe(email,password):
        return "salut",200
    return "nonnn", 500

@app.route('/auth/signin', methods = ['POST'])
def connexadmin():
    email = request.form['email']
    password = request.form['password']
    if connexionAdmin(email,password):
        return "salut",200
    return "nonnn", 500
    
@app.route('/logout', methods = ['GET','POST'])
def logout():
    session.clear()
    return 'tapaka', 200
    