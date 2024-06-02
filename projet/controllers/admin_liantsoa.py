from flask import render_template
from projet import app


@app.route('/login-admin', methods = ['GET'])
def login_admin():
    return render_template("login-admin.html")