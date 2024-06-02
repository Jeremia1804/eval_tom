from flask import session

def getMyId():
    return session['user'].get('id')