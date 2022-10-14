import pandas as pd
import mysql.connector as mysql

jsonFile = 'https://data.sfgov.org/resource/yitu-d5am.json'
pd_object = pd.read_json(jsonFile, typ='series')
df = pd.DataFrame(pd_object)
df.head(5)

config = {
  'user': 'root',
  'passwd': 'password',
  'host': '127.0.0.1',
  'database': 'py_sql_training',
  'raise_on_warnings': True
}

cnx = mysql.connect(**config)

server = cnx.cursor()

cnx.close()