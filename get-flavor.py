from requests.exceptions import ConnectionError,RequestException,HTTPError
import json
import requests
import sys

print(sys.version)

APIUSER = 'gncu63028597'
APIPASS = '9Lp8oonc%'
TENANT  = '09307a199b7040ae921fee464180d56a'

def get_conoha_token(tid, user, passwd):
  _api = 'https://identity.tyo1.conoha.io/v2.0/tokens'
  _header = {'Accept': 'application/json'}
  _body = {
    "auth":{
      "passwordCredentials":{
        "username": user,
        "password": passwd
        },
      "tenantId": tid
    }}

  try:
    _res = requests.post(_api, data=json.dumps(_body), headers=_header)
    _o = (json.loads(_res.text))
    # print(_o)
    return _o["access"]["token"]["id"]
  except (ValueError, NameError, ConnectionError, RequestException, HTTPError) as e:
    print('Error: Could not get Conoha token text.', e)
    sys.exit()

def show_flavor_uuid(tid, token):
  _api = 'https://compute.tyo1.conoha.io/v2/' + tid + '/flavors/detail'
  _header = {'Accept': 'application/json', 'X-Auth-Token': token}
  try:
    _res = requests.get(_api, headers=_header)
    for server in json.loads(_res.content)['flavors']:
      print('{name} => {id}'.format(name=server['name'], id=server['id']))
  except (ValueError, NameError, ConnectionError, RequestException, HTTPError) as e:
    print('Error: Could not get Conoha Plan(flavor) name and uuid.\n', e)
    sys.exit()

def main():
  Token = get_conoha_token(TENANT, APIUSER, APIPASS)

  show_flavor_uuid(TENANT, Token)

if __name__ == '__main__':
  main()

