from flask import redirect, render_template, request, url_for
from projet import app


@app.route('/login-admin', methods = ['GET'])
def login_admin():
    return render_template("login-admin.html")

@app.route('/liste-etape-ad', methods = ['GET'])
def liste_etape2():
    return render_template("admin/list-etapead.html")

@app.route('/coureur-temps' , methods = ['GET'])
def coureur_temps():
    return render_template("admin/coureur-temps.html")

@app.route('/print_chrono',methods=['POST'])
def printchrono():
    chrono = request.form['chrono']
    return {'response': chrono}

@app.route('/classement-equipe-ad' , methods = ['GET'])
def classment_eq():
    return render_template("admin/classement-equipe.html")

@app.route('/classement-etape-ad' , methods = ['GET'])
def classment_etape():
    return render_template("admin/classement-etape.html")

@app.route('/admin-home' , methods = ['GET','POST'])
def admin_home():
    return redirect(url_for('liste_etape2'))

@app.route('/import-first', methods =['GET'])
def import_first():
    return render_template("admin/import-first.html")

@app.route('/import-second', methods =['GET'])
def import_second():
    return render_template("admin/import-second.html")