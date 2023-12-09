import mysql.connector
import pandas as pd
import numpy as np
from mysql.connector import Error
import os
import re

os.chdir("C:/Users/Loupicha/Downloads/POEC Global Knowledge/Mise en situation")
print(os.getcwd())

connection = mysql.connector.connect(
  host="localhost",
  user="root",
  password=MotDePasse,
  database='dw_vente_bmw'
)

cursor = connection.cursor()

# Ventes par marque
cursor.execute('''SELECT * FROM tf_ventes_marque_bmw''')
db = cursor.fetchall()

ventes_par_marque_bmw = pd.DataFrame(columns=["id_vente", "Ventes", "Montant", "id_année", "id_mois", "id_jour", "id_marque"])
for i,r in enumerate(db):
    ventes_par_marque_bmw.loc[i]=r
print(ventes_par_marque_bmw)

# Ventes par zone geo
cursor.execute('''SELECT * FROM tf_ventes_zone_geo_bmw''')
db = cursor.fetchall()

ventes_par_zone_geo_bmw = pd.DataFrame(columns=["id_vente", "Ventes", "Montant", "id_marque", "id_année", "id_mois", "id_jour"])
for i,r in enumerate(db):
    ventes_par_zone_geo_bmw.loc[i]=r
print(ventes_par_zone_geo_bmw)

# Années
cursor.execute('''SELECT * FROM dim_annee''')
db = cursor.fetchall()

annees = pd.DataFrame(columns=["id_année", "annee"])
for i,r in enumerate(db):
    annees.loc[i]=r
print(annees)

# Marque
cursor.execute('''SELECT * FROM dim_marque''')
db = cursor.fetchall()

marque = pd.DataFrame(columns=["id_marque", "marque"])
for i,r in enumerate(db):
    marque.loc[i]=r
print(marque)

# Région
cursor.execute('''SELECT * FROM dim_zone_geo''')
db = cursor.fetchall()

zone_geo = pd.DataFrame(columns=["id_zone_geo", "zone_geo"])
for i,r in enumerate(db):
    zone_geo.loc[i]=r
print(zone_geo)