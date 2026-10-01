SELECT season, batting_team AS team, SUM(total_runs) AS value
FROM clean_ipl GROUP BY season, batting_team ORDER BY season;
