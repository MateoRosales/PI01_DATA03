from fastapi import FastAPI
from sqlalchemy import create_engine
from queries import query1, query2, query3, query4

engine = create_engine('mysql+pymysql://root:SQLmy.29luis@localhost:3306/proyectof1')

conn = engine.connect()

app=FastAPI()

@app.get('/query1')
def get_q1():
    return conn.execute(query1).fetchall()

@app.get('/query2')
def get_q2():
    return conn.execute(query2).fetchall()

@app.get('/query3')
def get_q3():
    return conn.execute(query3).fetchall()

@app.get('/query4')
def get_q4():
    return conn.execute(query4).fetchall()

@app.get('/')
def helloworld():
    return 'Henry - Mateo Rosales - Proyecto Individual 1'