' ------------------------- BASIC ROUTES -------------------------- '
@app.route('/')
@app.route('/home')  # page is linked to two routes
def index():
    return 'Index Page'

@app.route('/hello')
def hello():
    return 'Hello, World'


' ------------------------- BASIC ROUTES -------------------------- '
from markupsafe import escape

# show the user profile for that user
@app.route('/user/<username>')
def show_user_profile(username):

    return f'User {escape(username)}'

# show the post with the given id, the id is an integer
@app.route('/post/<int:post_id>')
def show_post(post_id):
    return f'Post {post_id}'

@app.route('/user/<username>')
def profile(username):
    return f'{username}\'s profile'

# show the subpath after /path/
@app.route('/path/<path:subpath>')
def show_subpath(subpath):
    return f'Subpath {escape(subpath)}'

# string: (default) accepts any text without a slash
# int: accepts positive integers
# float: accepts positive floating point values
# path: like string but also accepts slashes
# uuid: accepts UUID strings


' -------------------------- REVERSE URL --------------------------- '
url_for('index')
url_for('hello')
url_for('login', next='/')
url_for('profile', username='John Doe')


' ------------------------ REQUEST METHOD ------------------------- '
from flask import request

# Alternative 1
@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        return do_the_login()
    else:
        return show_the_login_form()

# Alternative 2
@app.get('/login')
def login_get():
    return show_the_login_form()

@app.post('/login')
def login_post():
    return do_the_login()

