#Même example avec Mysql
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

## Données prix BMW

# Nettoyage
excel_file = 'PRIX_BMW.xlsx'
df1 = pd.read_excel(excel_file, sheet_name=0)
df1["Marque"] = "BMW"

df2 = pd.read_excel(excel_file, sheet_name=1)
df2["Marque"] = "Mini"
df2["Prix min"] = df2["Prix min"].astype("str").str.replace(".", "")
df2["Prix max"] = df2["Prix max"].astype("str").str.replace(".", "")

df3 = pd.read_excel(excel_file, sheet_name=2)
df3["Marque"] = "Rolls-Royce"

# Concaténation
df = pd.concat([df1, df2, df3], ignore_index = True)
df["Prix min"] = df["Prix min"].astype("str").str.replace("\xa0", "").str.replace(",", ".").astype("float64")
df["Prix max"] = df["Prix max"].astype("str").str.replace("\xa0", "").str.replace(",", ".").astype("float64")
print(df)



# Intégration dans la base MySQL
cursor = connection.cursor()
for index, row in df.iterrows():
    query = "INSERT INTO referentiel_prix (prix_min, prix_max, modele, energie, marque) VALUES (%s, %s, %s, %s, %s)"
    values = (row['Prix min'], row['Prix max'], row['Modele'], row['Energie'], row['Marque'])
    cursor.execute(query, values)
    connection.commit()

cursor.close()



## Données ventes BMW

# Nettoyage
excel_file = 'BMW_report_2022.xlsx'
df1 = pd.read_excel(excel_file, sheet_name=1)
df1.drop(["Unnamed: 0", "Change in %"], axis=1, inplace=True)

# Préparation au pivot
df1.columns = "Ventes" + df1.columns
df1.rename(columns={"VentesUnnamed: 1": "Marque"}, inplace=True)
df1 = df1.loc[4:6]
df1 = pd.wide_to_long(df1, ["Ventes"], i = "Marque", j = "Année") # pivot

# df1.rename(index={"VentesMarque": "Marque"}, inplace=True)
df1["Ventes"] = df1["Ventes"].str.replace(",", "").astype("float64")
df1.reset_index(inplace = True)
print(df1)

# Création dimensions
annees= pd.DataFrame(df1['Année'].sort_values(ascending=False).unique())
annees['id'] = annees.index+1
annees.rename(columns={0: "Année"}, inplace=True)

marque= pd.DataFrame(df1.iloc[:,0].unique())
marque['id'] = marque.index+1
marque.rename(columns={0: "Marque"}, inplace=True)

# Insertion dans la base MySQL
cursor = connection.cursor()

for index, row in annees.iterrows():
    query = "INSERT INTO dim_annee (PK_Dim_Date,annee) VALUES (%s,%s)"
    values = (row['id'].item(), row['Année'].item())
    cursor.execute(query, values)

for index, row in marque.iterrows():
    query = "INSERT INTO dim_marque (iddim_marque,marque) VALUES (%s, %s)"
    values = (row['id'], row['Marque'])
    cursor.execute(query, values)

for index, row in df1.iterrows():
    fk_annee = annees[annees['Année']==row['Année']]['id'].iloc[0]
    fk_marque = marque[marque['Marque']==row['Marque']]['id'].iloc[0]
    query = "INSERT INTO tf_ventes_marque_bmw (Qtt_vendu,fk_annee,fk_marque) VALUES (%s,%s,%s)"
    values = (row['Ventes'], fk_annee.item(),fk_marque.item())
    cursor.execute(query, values)
    connection.commit()

cursor.close()


df2 = pd.read_excel(excel_file, sheet_name=2)
df2.rename(columns={"in 1,000 units" : "Région", "Unnamed: 1" : "Pays"}, inplace=True)
df2["Région"][6] = re.sub("thereof ", "", df2["Pays"][6])
df2.set_index("Région", inplace = True)
df2 = pd.concat([df2.loc[["Europe", "Americas", "Asia", "Other markets"]], df2[df2["Pays"] == "thereof China"]])
df2.drop(columns = "Pays", inplace = True)
df2 = df2.replace(",", "", regex=True).astype("float64")
df2.loc["Asia"] = df2.loc["Asia"] - df2.loc["China"]
df2.columns = "Ventes" + df2.columns
df2.reset_index(inplace = True)
df2 = pd.wide_to_long(df2, ["Ventes"], i = "Région", j = "Année")
df2.reset_index(inplace = True)
df2["Ventes"] = df2["Ventes"] * 1000
print(df2)


region = pd.DataFrame(df2.iloc[:,0].unique())
region['id'] = region.index+1
region.rename(columns={0: "Région"}, inplace=True)

cursor = connection.cursor()

for index, row in region.iterrows():
    query = "INSERT INTO dim_zone_geo (iddim_zone_geo, zone) VALUES (%s, %s)"
    values = (row['id'], row['Région'])
    cursor.execute(query, values)

for index, row in df2.iterrows():
    fk_annee = annees[annees['Année']==row['Année']]['id'].iloc[0]
    fk_region = region[region['Région']==row['Région']]['id'].iloc[0]
    query = "INSERT INTO tf_ventes_zone_geo_bmw (Qtt_vendu,fk_annee,fk_zone_geo) VALUES (%s,%s,%s)"
    values = (row['Ventes'], fk_annee.item(), fk_region.item())
    cursor.execute(query, values)
    connection.commit()

cursor.close()






# Données prix Stellantis
connection = mysql.connector.connect(
  host="localhost",
  user="root",
  password=MotDePasse,
  database='dw_vente_stellantis'
)


excel_file = 'Prix Stellantis.xlsx'
df1 = pd.read_excel(excel_file, sheet_name="Prix Stellantis")
df1 = df1.drop(columns = "Taille")

dollar_euro = 0.93
conv = pd.concat([df1[df1["Marque"] == "Chrysler"], df1[df1["Marque"] == "Dodge"]])
conv["Prix min"] = dollar_euro * conv["Prix min"].str.replace("$", "").astype("float64")
conv["Prix max"] = dollar_euro * conv["Prix max"].str.replace("$", "").astype("float64")
df1[(df1["Marque"] == "Chrysler") | (df1["Marque"] == "Dodge")] = conv

df2 = pd.read_excel(excel_file, sheet_name="Prix RAM")
df2["Marque"] = "RAM"
df2["Boite de vitesse"] = "Automatique"
df2["Prix min"] = pd.Series(map(lambda x : re.sub(",\d{2}$", "." + x[-2:], x), df2["Prix min"]))
df2["Prix max"] = pd.Series(map(lambda x : re.sub(",\d{2}$", "." + x[-2:], x), df2["Prix max"]))

df = pd.concat([df1, df2], ignore_index = True)
df["Prix min"] = df["Prix min"].astype("str").str.replace("\u202f", "").str.replace(",", "").astype("float64")
df["Prix max"] = df["Prix max"].astype("str").str.replace("\u202f", "").str.replace(",", "").astype("float64")
print(df)


cursor = connection.cursor()
for index, row in df.iterrows():
    query = "INSERT INTO referentiel_prix (prix_min, prix_max, modele, energie, boite_vitesse, marque) VALUES (%s, %s, %s, %s, %s, %s)"
    values = (row['Prix min'], row['Prix max'], row['Modele'], row['Energie'], row['Boite de vitesse'], row['Marque'])
    cursor.execute(query, values)
    connection.commit()

cursor.close()



# Données ventes Stellantis
excel_file = 'Classeur_2(4).xlsx'
df1 = pd.read_excel(excel_file, sheet_name=1)
df1.rename(columns={"Unités de ventes par zone géographique (milliers d'unités)" : "Région"}, inplace=True)
df1.replace({"Afrique & Moyen-Orient" : "Other markets", "Chine, Inde, Asie, Pacifique" : "Asia", "*Chine seule" : "China"}, inplace = True)
df1.set_index("Région", inplace = True)
df1 = df1.loc[["Amérique du Nord", "Europe", "Other markets", "Amérique du Sud", "Asia", "China"]]
df1.loc["Americas"] = df1.loc[["Amérique du Nord", "Amérique du Sud"]].sum()
df1.drop(index = ["Amérique du Nord", "Amérique du Sud"], inplace = True)
df1.loc["Asia"] = df1.loc["Asia"] - df1.loc["China"]
df1.columns = "Ventes" + df1.columns.map(lambda x : str(x))
df1.reset_index(inplace = True)
df1 = pd.wide_to_long(df1, ["Ventes"], i = "Région", j = "Année")
df1.reset_index(inplace = True)
df1["Ventes"] = df1["Ventes"] * 1000
print(df1)

annees= pd.DataFrame(df1['Année'].unique())
annees['id'] = annees.index+1
annees.rename(columns={0: "Année"}, inplace=True)

region = pd.DataFrame(df1.iloc[:,0].unique())
region['id'] = region.index+1
region.rename(columns={0: "Région"}, inplace=True)

cursor = connection.cursor()

for index, row in annees.iterrows():
    query = "INSERT INTO dim_annee (PK_Dim_Date, annee) VALUES (%s,%s)"
    values = (row['id'].item(), row['Année'].item())
    cursor.execute(query, values)

for index, row in region.iterrows():
    query = "INSERT INTO dim_zone_geo (iddim_zone_geo, zone) VALUES (%s, %s)"
    values = (row['id'], row['Région'])
    cursor.execute(query, values)

for index, row in df1.iterrows():
    fk_annee = annees[annees['Année']==row['Année']]['id'].iloc[0]
    fk_region = region[region['Région']==row['Région']]['id'].iloc[0]
    query = "INSERT INTO tf_ventes_zone_geo_stellantis (Qtt_vendu,fk_annee,fk_zone_geo) VALUES (%s,%s,%s)"
    values = (row['Ventes'], fk_annee.item(), fk_region.item())
    cursor.execute(query, values)
    connection.commit()

cursor.close()
connection.close()


