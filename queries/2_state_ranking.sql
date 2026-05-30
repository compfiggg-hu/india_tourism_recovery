WITH recovery_2022 AS (
  SELECT 
    s.state, 
    -- Added SAFE_CAST here just in case the data type error returns
    ROUND(SAFE_CAST(s.domestic_tourists AS INT64) * 100 / SAFE_CAST(b.domestic_tourists AS INT64), 1) AS recovery_index 
  FROM `tourism-recovery-analysis.tourism.state_wise` s 
  JOIN (
    SELECT state, domestic_tourists 
    FROM `tourism-recovery-analysis.tourism.state_wise` 
    WHERE year = 2019
  ) b -- <--- THIS "b" WAS MISSING!
    ON s.state = b.state 
  WHERE s.year = 2022
) 
SELECT 
  *, 
  RANK() OVER (ORDER BY recovery_index DESC) AS recovery_rank 
FROM recovery_2022 
ORDER BY recovery_rank
LIMIT 10;