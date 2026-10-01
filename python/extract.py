import mysql.connector, json, getpass

password = getpass.getpass("MySQL password: ")
conn = mysql.connector.connect(host="localhost", user="root",
                               password=password, database="sql_to_d3")
cur = conn.cursor()
cur.execute("""
    SELECT CAST(batch_year AS CHAR) AS label, COUNT(*) AS value
    FROM clean_yc
    WHERE batch_year IS NOT NULL
    GROUP BY batch_year ORDER BY batch_year
""")
data = [{"label": r[0], "value": int(r[1])} for r in cur.fetchall()]
json.dump(data, open("viz/data.json", "w"), indent=2)
print(len(data), "rows written")
