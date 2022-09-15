from sqlalchemy import create_engine, MetaData
import pymysql

engine = create_engine('mysql+pymysql://root:SQLmy.29luis@localhost:3306/proyectof1')

conn = engine.connect()
 