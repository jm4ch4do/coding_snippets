''' ------------------- CONCEPT ---------------- '''
# You consume APIs to get access to services provided by others
# 1. Send a get query to API with parameters
# 2. API returns JSON response


''' ------------------- URL ---------------- '''
# for practicing you can use this site
# www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita
# or any other in this list
# https://mixedanalytics.com/blog/list-actually-free-open-no-auth-needed-apis/

''' ------------------- INSTALL ---------------- '''
pip install requests  # get the get query


''' ------------------- IMPORTS ---------------- '''
import requests


''' ------------------- EXAMPLE ---------------- '''
# goal_url = www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita

import requests

base_url = 'https://www.thecocktaildb.com/api/json/v1/1/search.php?'
parameters = {'s': 'margarita'}
response = requests.get(base_url, params=parameters)
url = response.url
text = response.text
status_code = response.status_code
