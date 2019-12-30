import json
from flask import Flask
app = Flask(__name__)

@app.route('/')
def app1():
        with open('sample.json', 'r') as samplejson:
                data = samplejson.read()
                return data

if __name__ == '__main__':
       app.run(host='0.0.0.0', port=8080)
