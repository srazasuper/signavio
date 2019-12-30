import json
from collections import *
import requests
from constants import variables
from flask import Flask
app = Flask(__name__)

@app.route('/')
def app2():
        r = requests.get(variables.app1url)
        data = json.loads(r.text, object_pairs_hook=OrderedDict)
        for k,v in data.items():
                data[k] = data[k][::-1]
        return data

if __name__ == '__main__':
        app.run(host='0.0.0.0', port=9090)
