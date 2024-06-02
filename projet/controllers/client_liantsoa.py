from flask import redirect, render_template, url_for
from projet import app

@app.route('/', methods = ['GET'])
def index():
    return redirect(url_for('login_equipe'))


@app.route('/login-equipe', methods = ['GET'])
def login_equipe():
    return render_template("login-equipe.html")

