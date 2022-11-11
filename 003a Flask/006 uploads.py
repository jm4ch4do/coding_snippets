' ---------------------------- UPLOADS ----------------------------- '
# You can handle uploaded files with Flask easily. Just make sure 
# not to forget to set the enctype="multipart/form-data" attribute 
# on your HTML form, otherwise the browser will not transmit your
# files at all.

from flask import request

@app.route('/upload', methods=['GET', 'POST'])
def upload_file():
    if request.method == 'POST':
        f = request.files['the_file']
        f.save('/var/www/uploads/uploaded_file.txt')



