import sqlite3
import pandas as pd

# Connect to the SQLite database
connection = sqlite3.connect("houston_real_estate.db")

# Read the property_analysis table
df = pd.read_sql_query(
    "SELECT * FROM property_analysis",
    connection
)

# Export to CSV
df.to_csv("property_analysis.csv", index=False)

# Close the database
connection.close()

print("property_analysis.csv created successfully!")