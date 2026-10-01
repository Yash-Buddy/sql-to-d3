# sql-to-d3

Learning SQL and data viz by building a CSV → MySQL → Python → browser charts pipeline.

## Projects
**1. Y Combinator startups**: 6,200 rows, startups per batch year.
**2. IPL**: 87,074 deliveries, 365 matches, 11 charts (ECharts + Tailwind).

## Screenshots
![IPL dark dashboard](docs/ipl-dark.png)
![IPL light report](docs/ipl-light.png)
![YC chart](docs/yc.png)

## What I solved
- Staging → clean table pattern (`stg_*` → `clean_*`) with typed columns
- Verified row counts after every load
- IPL: incomplete matches found and handled
- IPL: inconsistent player names fixed with `player_alias` + LEFT JOIN + COALESCE
- Python scripts run every `.sql` file and export JSON for the charts

## What I learned
- Staging vs clean tables, and verifying counts after every load
- Fixing messy real data with LEFT JOIN + COALESCE
- Exporting SQL results to JSON with Python for browser charts

## Run
    python3 python/run_all.py
    cd viz && python3 -m http.server 8000
