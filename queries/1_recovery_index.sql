WITH base_2019 AS (
  SELECT 
    state, 
    SAFE_CAST(domestic_tourists AS INT64) AS domestic_tourists, 
    SAFE_CAST(foreign_tourists AS INT64) AS foreign_tourists
  FROM `tourism-recovery-analysis.tourism.state_wise`
  WHERE year = 2019
)
SELECT 
  s.year, 
  s.state, 
  SAFE_CAST(s.domestic_tourists AS INT64) AS domestic_tourists, 
  SAFE_CAST(s.foreign_tourists AS INT64) AS foreign_tourists,
  ROUND(SAFE_CAST(s.domestic_tourists AS INT64) * 100 / b.domestic_tourists, 1) AS domestic_recovery_index, 
  ROUND(SAFE_CAST(s.foreign_tourists AS INT64) * 100 / b.foreign_tourists, 1) AS foreign_recovery_index
FROM `tourism-recovery-analysis.tourism.state_wise` s
JOIN base_2019 b 
  ON s.state = b.state
WHERE s.year >= 2019
ORDER BY s.state, s.year;