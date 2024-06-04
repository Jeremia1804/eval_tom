from projet import app
from flask import session, redirect, url_for,render_template,request
from projet.services.service_session import connexionAdmin, connexionEquipe

@app.route('/equipe/signin', methods = ['POST'])
def connexclient():
    email = request.form['email']
    password = request.form['password']
    if connexionEquipe(email,password):
        return redirect(url_for('equipe_home'))
    return redirect(url_for('login_equipe'))

@app.route('/auth/signin', methods = ['POST'])
def connexadmin():
    email = request.form['email']
    password = request.form['password']
    if connexionAdmin(email,password):
        return redirect(url_for('admin_home'))
    return redirect(url_for('login_admin'))
    
@app.route('/logout', methods = ['GET','POST'])
def logout():
    session.clear()
    return redirect(url_for('index'))
    