from io import BytesIO
from flask import render_template
from xhtml2pdf import pisa


def render_pdf(html):
    pdf = BytesIO()
    encoded_html = html.encode('utf-8')
    pisa.CreatePDF(BytesIO(encoded_html), pdf)
    return pdf.getvalue()


def get_pdf(id):
    html = render_template('admin/monpdf.html')    
    pdf = render_pdf(html)

    pdf_io = BytesIO(pdf)
    return pdf_io