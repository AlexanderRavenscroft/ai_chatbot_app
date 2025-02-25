from flask import Flask

app = Flask(__name__)
counter = 0

@app.route('/increment', methods=['GET'])
def increment():
    global counter
    counter += 1
    return 'I HATE NIGGERS'
    return str(counter)

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=50162)