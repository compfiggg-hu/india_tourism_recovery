SELECT   
  state,   
  year,   
  SAFE_CAST(domestic_tourists AS INT64) AS domestic_tourists,   
  SAFE_CAST(foreign_tourists AS INT64) AS foreign_tourists,   
  ROUND(
    SAFE_CAST(domestic_tourists AS INT64) * 100 / 
    (SAFE_CAST(domestic_tourists AS INT64) + SAFE_CAST(foreign_tourists AS INT64)), 
    1
  ) AS domestic_pct 
FROM tourism.state_wise 
WHERE year IN (2019, 2022) 
ORDER BY state, year;