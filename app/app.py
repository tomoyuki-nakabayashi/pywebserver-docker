from bottle import route, run

@route('/')
def home():
    return ("It isn't fancy, but it's my home page")

run(host='0.0.0.0', port=9999)
