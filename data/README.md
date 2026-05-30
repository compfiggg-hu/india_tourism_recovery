# Tourism Data — Cleaned and Analysis-Ready

## Files in this folder

### Raw Data (`raw/`)

**state_wise_tourism_data.csv**
- Source: Ministry of Tourism, Government of India
- 36 states/UTs, 7 years (2016–2022)
- Columns: year, state, domestic_tourists, foreign_tourists
- Row count: ~252 rows (36 states × 7 years)
- Data quality: Consistent reporting across states

**fta_by_country_annual_2018-2022_.csv**
- Source: Ministry of Tourism, Foreign Tourist Arrivals portal
- Top 75 countries sending tourists to India
- Columns: Country, Year, fta_count
- Row count: 375 rows (75 countries × 5 years)
- Data quality: Standardized annually by country

**fta_by_region_annual.csv**
- Source: Ministry of Tourism regional breakdown
- 9 regions, 5 years (2018–2022)
- Columns: region, year, fta_count
- Row count: 45 rows
- Data quality: Aggregated regional totals

**montly_fta.csv**
- Source: Ministry of Tourism, monthly data
- Monthly foreign tourist arrivals 2018–2022
- Columns: year, month, fta_count
- Row count: 60 rows (12 months × 5 years)
- Data quality: Subject to seasonal variation

### Cleaned Data (`clean/`)

**state_wise_clean.csv**
- Cleaned version of state_wise_tourism_data.csv
- All fta_count commas removed, converted to numeric
- State names standardized to consistent format
- 252 rows, 4 columns: year, state, domestic_tourists, foreign_tourists
- Ready for BigQuery analysis

**fta_country_clean.csv**
- Cleaned version of fta_by_country_annual
- Column names standardized
- fta_count converted to numeric
- 375 rows, 3 columns: country, year, foreign_tourists

**fta_region_clean.csv**
- Cleaned version of fta_by_region_annual
- fta_count converted to numeric
- 45 rows, 3 columns: region, year, foreign_tourists

**fta_monthly_clean.csv**
- Cleaned version of montly_fta
- Empty unnamed columns dropped
- fta_count converted to numeric
- 60 rows, 3 columns: year, month, foreign_tourists

**recovery_index_state_wise.csv**
- **Output from BigQuery Query 1**
- Recovery index calculation: 2022 tourist arrivals as % of 2019 baseline
- Columns: state, year, domestic_tourists, foreign_tourists, domestic_recovery_index, foreign_recovery_index
- 108 rows (36 states × 3 years: 2019, 2021, 2022)
- Used in: Recovery Index map, State Ranking chart

**domestic_vs_foreign_split.csv**
- **Output from BigQuery Query 3**
- Domestic and foreign composition by state
- Columns: state, year, domestic_tourists, foreign_tourists, domestic_pct, foreign_pct
- 108 rows (36 states × 3 years: 2019, 2021, 2022)
- Used in: Domestic vs Foreign Mix stacked bar chart

## Data Quality Notes
- All numeric columns verified against Ministry of Tourism published reports
- State names standardized to RBI DBIE naming convention
- Foreign arrivals granular by country and month to enable detailed analysis
- Population data excluded due to source inconsistencies (Census 2011 vs MOSPI)

## Processing Notes
- R script (readr, tidyverse): remove commas, convert strings to numeric
- BigQuery: standard SQL joins, window functions for ranking
- No rows dropped during cleaning; all data preserved in clean/ folder
- 2023 data incomplete; analysis uses 2016–2022 for consistency

## Updates
Last cleaned: May 29, 2026
RBI DBIE data through 2022
Ministry of Tourism data through 2023 (partial)