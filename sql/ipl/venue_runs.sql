SELECT venue AS label, SUM(total_runs) AS value FROM clean_ipl
GROUP BY venue ORDER BY value DESC LIMIT 12;
