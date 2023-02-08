import os
from flask import Flask, render_template, jsonify
from flask_restful import Api, Resource
from flask_sqlalchemy import SQLAlchemy
from flaskext.mysql import MySQL

def create_app(test_config=None):
    # create and configure the app
    app = Flask(__name__, instance_relative_config=True)
    api = Api(app)
    app.config.from_mapping(
        SECRET_KEY='dev',
        DATABASE=os.path.join(app.instance_path, 'flaskr.sqlite'),
    )

    # create and configure the db
    mysql = MySQL()
    # MySQL configurations
    app.config['MYSQL_DATABASE_USER'] = 'root'
    app.config['MYSQL_DATABASE_PASSWORD'] = '97#708March'
    app.config['MYSQL_DATABASE_DB'] = 'web_hw'
    app.config['MYSQL_DATABASE_HOST'] = 'localhost'
    mysql.init_app(app)

    if test_config is None:
        # load the instance config, if it exists, when not testing
        app.config.from_pyfile('config.py', silent=True)
    else:
        # load the test config if passed in
        app.config.from_mapping(test_config)

    # ensure the instance folder exists
    try:
        os.makedirs(app.instance_path)
    except OSError:
        pass

    # a simple page that says hello
    @app.route('/hello')
    def hello():
        return 'Hello, World!'

    # welcome page
    class LandingPage(Resource):
        def get(self):
            return 'welcome to the landing page for jack kelly!'
    
    api.add_resource(LandingPage, '/welcome')

    @app.route('/db')
    def db():
        try:
            conn = mysql.connect()
            cursor = conn.cursor()
            with open("query2.sql", "r") as f:
                query = f.read()
            cursor.execute(query)
            rows = cursor.fetchall()
            columns = [col[0] for col in cursor.description]
            result = []
            for row in rows:
                result.append(dict(zip(columns, row)))
            for dictionary in result:
                print(dictionary)
                print("-------------------")
            return render_template('index.html',data=result)
        except Exception as e:
            return str(e)
        finally:
            cursor.close()
            conn.close()

    return app