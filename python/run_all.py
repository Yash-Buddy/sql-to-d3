import mysql.connector, json, glob, os, getpass
from decimal import Decimal

conn = mysql.connector.connect(host="localhost", user="root",
                               password=getpass.getpass("MySQL password: "), database="sql_to_d3")
fix = lambda v: float(v) if isinstance(v, Decimal) else v
os.makedirs("viz/data", exist_ok=True)
for f in sorted(glob.glob("sql/ipl/*.sql")):
    cur = conn.cursor()
    cur.execute(open(f).read())
    cols = [c[0] for c in cur.description]
    rows = [dict(zip(cols, map(fix, r))) for r in cur.fetchall()]
    out = "viz/data/" + os.path.basename(f).replace(".sql", ".json")
    json.dump(rows, open(out, "w"), indent=2, default=str)
    print(len(rows), "rows ->", out)
