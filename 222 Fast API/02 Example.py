''' ------------------- EXAMPLE ---------------- '''
# goal_url = www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita

import requests
import json

# get response
base_url = 'https://www.thecocktaildb.com/api/json/v1/1/search.php?'
parameters = {'s': 'margarita'}
response = requests.get(base_url, params=parameters)

# save values from response
url = response.url
content = response.content
status_code = response.status_code

# convert json response to dict
info = json.loads(content)

# print all drinks of type margarita
drinks = info['drinks']
for drink in drinks:
    print(drink['strDrink'])
