SELECT COALESCE(a.player, c.bowler) AS label, COUNT(*) AS value
FROM clean_ipl c LEFT JOIN player_alias a ON c.bowler = a.alias
WHERE c.wicket_type IS NOT NULL AND c.wicket_type <> ''
  AND c.wicket_type NOT IN ('run out','retired hurt','retired out','obstructing the field')
GROUP BY label ORDER BY value DESC LIMIT 10;
