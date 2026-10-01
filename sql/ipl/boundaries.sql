SELECT COALESCE(a.player, c.striker) AS label,
       SUM(c.runs_of_bat = 6) AS sixes, SUM(c.runs_of_bat = 4) AS fours
FROM clean_ipl c LEFT JOIN player_alias a ON c.striker = a.alias
GROUP BY label ORDER BY sixes DESC LIMIT 10;
