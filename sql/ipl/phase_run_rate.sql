SELECT CASE WHEN over_no < 6 THEN 'Powerplay' WHEN over_no < 15 THEN 'Middle' ELSE 'Death' END AS label,
       ROUND(SUM(total_runs) * 6 / SUM(is_wide = 0 AND is_noball = 0), 2) AS value
FROM clean_ipl GROUP BY label ORDER BY FIELD(label,'Powerplay','Middle','Death');
