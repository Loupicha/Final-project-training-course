import pandas as pd
import numpy as np
import os
import re

os.chdir("C:/Users/Loupicha/Downloads/POEC Global Knowledge/Mise en situation")
print(os.getcwd())

excel_file = 'gmr-management-report-vw-ar22.xlsx'
df = pd.read_excel(excel_file, sheet_name = "gmr-forecast-versus-actual", header = 4)
df = pd.DataFrame(df.iloc[1])
df.replace({"8.9\xa0million" : 8900000, "5–10% increase" : 1.075 * 8900000, "around the prior-year level" : 8900000, "8.3\xa0million" : 8300000}, inplace = True)
df.reset_index(inplace = True)
df.columns = ["Year", "Deliveries"]
df.drop(0, inplace = True)
print(df)

df.to_excel("forecast_sales.xlsx")