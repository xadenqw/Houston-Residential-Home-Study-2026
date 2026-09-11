import pandas as pd
import sqlite3

# Load the two Excel datasets
area1 = pd.read_excel("cleaned77007-77055.xlsx")
area2 = pd.read_excel("cleaned77498-77407.xlsx")

# Identify each geographic area
area1["Area"] = "77007-77055"
area2["Area"] = "77498-77407"

# Combine the two areas
combined = pd.concat([area1, area2], ignore_index=True)

# Create the SQL database
connection = sqlite3.connect("houston_real_estate.db")

# Put the combined data into a SQL table
combined.to_sql(
    "properties",
    connection,
    if_exists="replace",
    index=False
)

connection.close()

print("Database created successfully!")