SELECT season AS label, SUM(total_runs) AS value,
       ROUND(SUM(total_runs)/COUNT(DISTINCT match_id),1) AS avg_per_match
FROM clean_ipl GROUP BY season ORDER BY season;
