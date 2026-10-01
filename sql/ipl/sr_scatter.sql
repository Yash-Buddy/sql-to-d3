SELECT COALESCE(a.player, c.striker) AS label, SUM(c.runs_of_bat) AS runs,
       SUM(c.is_wide = 0) AS balls,
       ROUND(SUM(c.runs_of_bat) * 100 / SUM(c.is_wide = 0), 1) AS strike_rate
FROM clean_ipl c LEFT JOIN player_alias a ON c.striker = a.alias
GROUP BY label HAVING balls >= 500 ORDER BY runs DESC LIMIT 40;
