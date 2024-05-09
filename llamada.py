import requests

url = 'http://traductor-production-b952.up.railway.app/translate' #direcion
data = {'textsource': 'Hello, how are you?', 'target_lang': 'ES'}

response = requests.post(url, json=data)

if response.status_code == 200:
    translated_text = response.json()['result']
    print(translated_text)
else:
    print('Error en la solicitud:', response.status_code)