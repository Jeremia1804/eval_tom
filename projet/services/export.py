from io import BytesIO
from flask import render_template
from xhtml2pdf import pisa
# import docraptor

from projet.models.champion import Champion

def render_pdf(html):
    pdf = BytesIO()
    encoded_html = html.encode('utf-8')
    pisa.CreatePDF(BytesIO(encoded_html), pdf)
    return pdf.getvalue()

def get_pdf(id):
    champion = Champion.query.filter_by(idcategorie=id).first()
    categorie = champion.nom
    equipe = champion.nomequipe
    point = champion.point
    date = "04-06-2024"
    html = render_template('admin/monpdf.html',categorie=categorie, equipe=equipe,point =point,date=date)    

    pdf = render_pdf(html)
    pdf_io = BytesIO(pdf)

    return pdf_io