''' -------------- EXAMPLE API WITH CREDENTIALS ----------- '''
# create an account to get API Key
# https://openweathermap.org/

api_key = 'putkeyhere'
base_url = 'https://api.openweathermap.org/data/2.5/weather?'
parameters = {'lat': '52.9399', 'lon': '73.5491', 'appid': api_key}
response = requests.get(base_url, params=parameters)

print(response)
