''' -------------------------- TEST FORM VIEW ----------------------- '''
@pytest.mark.django_db
def test_create_endpoint_receives_form_data(client, logged_user):
    '''
        Test note creation
    '''
    
    form_data = {'title': "An impressive title", 'text': 'An interesting text'}
    
    response = client.post(path='/smart/notes/new', data=form_data, follow=True)
    
    assert 200 == response.status_code  # status code returned
    assert 'notes/notes_list.html' in response.template_name  # template used
    assert 1 == logged_user.notes.count()  # new user in database
    assert "An impressive title" == logged_user.notes.first().title  # the right title was assigned
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
