import pandas as pd

df1 = pd.read_excel("cleaned77007.xlsx")
df2 = pd.read_excel("cleaned77055.xlsx")

combined = pd.concat([df1, df2], ignore_index=True)

combined.to_excel("cleaned77007-77055.xlsx", index=False)