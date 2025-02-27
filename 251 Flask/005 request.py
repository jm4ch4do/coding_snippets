' ---------------------------- REQUEST ----------------------------- '
method = request.method  # method is GET, POST, PUT
data = request.form    # access data in POST or PUT methods
searchword = request.args.get('key', '')  # get variable in URL

@app.route('/login', methods=['POST', 'GET'])
def login():
    error = None
    if request.method == 'POST':
        if valid_login(request.form['username'],
                       request.form['password']):
            return log_the_user_in(request.form['username'])
        else:
            error = 'Invalid username/password'
    return render_template('login.html', error=error)