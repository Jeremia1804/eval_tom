import os
import csv
from projet.db import db
from projet.models.import_modele import ImportEtapeModel, ImportResultModel
from projet.models.point import PointModel
from sqlalchemy import text
from projet.services.init_data import delete_all_data

def upload(file):
    filename = file.filename
    file_path = os.path.join('projet/uploads', filename)
    file.save(file_path)
    return 'projet/uploads/'+filename

def lire_file(fichier):
    donnees = []
    with open(fichier, 'r', encoding='utf-8-sig') as csvfile:
        csv_reader = csv.DictReader(csvfile)
        for row in csv_reader:
            donnees.append(row)
    return donnees

def importer_point(fichier):
    delete_all_data(PointModel)
    donnees = lire_file(fichier)
    for donnee in donnees:
        classement = donnee['classement'].strip()
        point = donnee['points'].strip()
        p = PointModel(int(classement), float(point))
        p.save_to_db()
    db.session.commit()

def insert_import_etape(fichier):
    donnees = lire_file(fichier)
    for donnee in donnees:
        etape = donnee['etape'].strip()
        longueur = float(donnee['longueur'].replace(',', '.').strip())
        nb_coureur = int(donnee['nb coureur'].strip())
        rang = int(donnee['rang'].strip())
        date_depart = donnee['date départ'].strip()
        heure_depart = donnee['heure départ'].strip()

        etape_obj = ImportEtapeModel(
            etape=etape,
            longueur=longueur,
            nb_coureur=nb_coureur,
            rang=rang,
            date_depart=date_depart,
            heure_depart=heure_depart
        )
        etape_obj.save_to_db()

def insert_import_resultat(fichier):
    donnees = lire_file(fichier)
    for donnee in donnees:
        etape_rang = int(donnee['etape_rang'].strip())
        numero_dossard = int(donnee['numero dossard'].strip())
        nom = donnee['nom'].strip()
        genre = donnee['genre'].strip()
        date_naissance = donnee['date naissance'].strip()
        equipe = donnee['equipe'].strip()
        arrivee = donnee['arrivée'].strip()

        coureur = ImportResultModel(
            etape_rang=etape_rang,
            numero_dossard=numero_dossard,
            nom=nom,
            genre=genre,
            date_naissance=date_naissance,
            equipe=equipe,
            arrivee=arrivee
        )
        coureur.save_to_db()

def importer_etape_resultat(etape,resultat):
    delete_all_data(ImportEtapeModel,ImportResultModel)
    insert_import_etape(etape)
    insert_import_resultat(resultat)
    db.session.commit()
    executerequete()
    db.session.commit()

def executerequete():
    db.session.execute(text("insert into etape (nom,rang,nombre_coureur,longueur,debut) select * from v_impetape"))
    db.session.execute(text("insert into equipe (nom,login,pwd) select * from v_impequipe"))
    db.session.flush()
    db.session.execute(text("insert into coureur (nom,numero,genre,dtn,idequipe) select * from v_impcoureur"))
    db.session.execute(text("insert into etape_coureur(idetape,idcoureur) select * from v_impetapecoureur"))
    db.session.execute(text("insert into participation (idetape,idcoureur,arrive) select * from v_impparticipation"))