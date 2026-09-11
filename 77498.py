import pandas as pd

print(pd.__version__)

df = pd.read_excel("77498.xlsx")

columns = [
    "Baths Total",
    "Bedrooms",
    "Building SqFt",
    "CDOM",
    "Close Price",
    "Current Price",
    "List Price",
    "Lot Size",
    "Address",
    "Subdivision",
    "Year Built",
    "Zip Code"
]

df = df[columns]

df.columns = [
    "Baths Total",
    "Bedrooms",
    "Building SqFt",
    "CDOM",
    "Close Price",
    "Current Price",
    "List Price",
    "Lot Size",
    "Address",
    "Subdivision",
    "Year Built",
    "Zip Code"
]

df.to_excel("cleaned77498.xlsx", index=False)

print("Code Successful")