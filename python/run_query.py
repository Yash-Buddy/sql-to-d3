import mysql.connector, json, sys, getpass
from decimal import Decimal

sql_file, out_file = sys.argv[1], sys.argv[2]
sql = open(sql_file).read()

password = getpass.getpass("MySQL password: ")
conn = mysql.connector.connect(host="localhost", user="root",
                               password=password, database="sql_to_d3")
cur = conn.cursor()
cur.execute(sql)

cols = [c[0] for c in cur.description]
fix = lambda v: float(v) if isinstance(v, Decimal) else v
rows = [dict(zip(cols, map(fix, r))) for r in cur.fetchall()]

json.dump(rows, open(out_file, "w"), indent=2, default=str)
print(len(rows), "rows written to", out_file)
