''' -------------------------- TEST LIST VIEW ----------------------- '''
# to make more complex analysis of html you can use beautiful soup

@pytest.mark.django_db  # give access to database
def test_list_endpoint_return_user_notes(client):
    
    '''
        A user get's to see his own notes
    '''

    # create user an sign in with it
    user = User.objects.create_user('Clara', 'clara@example.com', 'password')
    client.login(username=user.username, password='password')
    
    # create two notes from current user
    note = Notes.objects.create(title='An interesting title', text='', user=user)
    note2 = Notes.objects.create(title='Another title', text='', user=user)
    
    # make sure the user can see his two notes
    response = client.get(path='/smart/customers')
    assert 200 == response.status_code
    content = str(response.content)
    assert "An interesting title" in content
    assert "Another title" in content
    assert 2 == content.count('<h3>')
    
    
@pytest.mark.django_db  # give access to database
def test_list_endpoint_only_list_notes_from_authenticated_user(client):
    
    '''
        A user get's to see his own notes, and doesn't get notes from other users
    '''

    # create user and a note for him
    jon = User.objects.create_user('Jon', 'jon@test.com', 'password')
    note = Notes.objects.create(title="Jon's Note", text='', user=jon)
    
    # create another user with two notes and login
    user = User.objects.create_user('Clara', 'clara@example.com', 'password')
    client.login(username=user.username, password='password')
    note = Notes.objects.create(title='An interesting title', text='', user=user)
    note2 = Notes.objects.create(title='Another title', text='', user=user)
    
    # get content from website
    response = client.get(path='/smart/customers')
    content = str(response.content)
    
    # tests
    assert 200 == response.status_code  # website respons ok
    assert "An interesting title" in content  # first note is in content
    assert "Another title" in content  # second note also in content
    assert "Jon's note" not in content  # notes from another user don't get into you content
    assert 2 == content.count('<h3>')  # you have one <h3> for each note 
    
    
@pytest.mark.django_db
def test_create_endpoint_receives_form_data(client, logged_user):
    form_data = {'title': "An impressive title", 'text': 'An interesting text'}