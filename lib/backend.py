from flask import Flask, request

app = Flask(__name__)

@app.route('/increment', methods=['GET'])
def increment():
    usrInput = request.args.get('usrInput', type=int)  
    if(usrInput == 7 ):
        return str('Wysłałeś 7')
    else:
        return str('Nwm co wysłałeś')

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=50162)