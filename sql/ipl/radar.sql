SELECT COALESCE(a.player, c.striker) AS label, SUM(c.runs_of_bat) AS runs,
       SUM(c.runs_of_bat = 6) AS sixes, SUM(c.runs_of_bat = 4) AS fours,
       ROUND(SUM(c.runs_of_bat) * 100 / SUM(c.is_wide = 0), 1) AS strike_rate
FROM clean_ipl c LEFT JOIN player_alias a ON c.striker = a.alias
GROUP BY label ORDER BY runs DESC LIMIT 5;
