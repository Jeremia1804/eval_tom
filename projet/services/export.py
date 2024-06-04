from flask import render_template
# import docraptor

from projet.models.champion import Champion

def get_pdf(id):
    champion = Champion.query.filter_by(idcategorie=id).first()
    # categorie = champion.nom
    # equipe = champion.nomequipe
    # point = champion.point
    # date = "02-03-2024"
    # html = render_template('admin/monpdf.html',categorie=categorie, equipe=equipe,point =point,date=date)    

    # doc_api = docraptor.DocApi()
    # doc_api.api_client.configuration.username = '5HpNsMvTVZ6aweuqgoRY'
    # # doc_api.api_client.configuration.debug = True

    # response = doc_api.create_doc({
    # "test": True,                                                   # test documents are free but watermarked
    # "document_content": html,    # supply content directly
    # # "document_url": "http://docraptor.com/examples/invoice.html", # or use a url
    # "name": "docraptor-python.pdf",                                 # help you find a document later
    # "document_type": "pdf",                                         # pdf or xls or xlsx
    
    # })
    # return response
    return champion