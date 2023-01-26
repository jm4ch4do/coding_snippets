''' ------------------- STEP EXAMPLE ---------------- '''
Scenario: Search for an account
   Given I search for a valid account
    Then I will see the account details
    
@given('I search for a valid account')
def step_impl(context):
    context.browser.get('http://localhost:8000/index')
    form = get_element(context.browser, tag='form')
    get_element(form, name="msisdn").send_keys('61415551234')
    form.submit()

@then('I will see the account details')
def step_impl(context):
    elements = find_elements(context.browser, id='no-account')
    eq_(elements, [], 'account not found')
    h = get_element(context.browser, id='account-head')
    ok_(h.text.startswith("Account 61415551234"),
        'Heading %r has wrong text' % h.text)

    
''' ------------------- EXECUTE STEPS ---------------- '''
# execute_steps() can be used to run other steps
@when('I do the same thing as before')
def step_impl(context):
    context.execute_steps('''
        when I press the big red button
         and I duck
    ''')
    

''' ------------------- PARAMETERS ---------------- '''
Scenario: look up a book
  Given I search for a valid book
   Then the result page will include "success"
    
@then('the result page will include "{text}"')
def step_impl(context, text):
    if text not in context.response:
        fail('%r not in %r' % (text, context.response))


