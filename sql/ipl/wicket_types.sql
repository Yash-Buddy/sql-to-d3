SELECT wicket_type AS label, COUNT(*) AS value FROM clean_ipl
WHERE wicket_type IS NOT NULL AND wicket_type <> ''
GROUP BY wicket_type ORDER BY value DESC;
