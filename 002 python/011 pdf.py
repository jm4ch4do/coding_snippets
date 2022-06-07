pip install pdfminer.six
import io
import os

from pdfminer.converter import TextConverter
from pdfminer.pdfinterp import PDFPageInterpreter
from pdfminer.pdfinterp import PDFResourceManager
from pdfminer.pdfpage import PDFPage

''' ---------------------------- OPEN FILES  ---------------------------  '''
# get path to file
rel_path = os.path.join('..', 'data', 'factura1.pdf')
abs_path = os.path.abspath(rel_path)
  



def extract_text_by_page(pdf_path):
    with open(pdf_path, 'rb') as fh:
        for page in PDFPage.get_pages(fh,
                                      caching=True,
                                      check_extractable=True):
            resource_manager = PDFResourceManager()
            fake_file_handle = io.StringIO()
            converter = TextConverter(resource_manager, fake_file_handle)
            page_interpreter = PDFPageInterpreter(resource_manager, converter)
            page_interpreter.process_page(page)

            text = fake_file_handle.getvalue()
            yield text

            # close open handles
            converter.close()
            fake_file_handle.close()

            
def extract_text(pdf_path):
    pages = [page for page in extract_text_by_page(pdf_path)]
        
pages = extract_text(abs_path)