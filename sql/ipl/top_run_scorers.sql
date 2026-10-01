SELECT COALESCE(a.player, c.striker) AS label,
       SUM(c.runs_of_bat) AS value
FROM clean_ipl c
LEFT JOIN player_alias a ON c.striker = a.alias
GROUP BY label
ORDER BY value DESC
LIMIT 10;
