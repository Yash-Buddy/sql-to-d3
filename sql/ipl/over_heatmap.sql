SELECT season, over_no, ROUND(SUM(total_runs)/COUNT(DISTINCT match_id, innings),2) AS value
FROM clean_ipl WHERE innings IN (1,2)
GROUP BY season, over_no ORDER BY season, over_no;
