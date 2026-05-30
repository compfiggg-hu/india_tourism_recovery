# India Tourism Recovery: Post-COVID State Analysis

## Objective
Identify which Indian states recovered fastest from COVID's tourism collapse 
(2020) by 2022, and whether recovery was driven by foreign or domestic tourism.

## Data Sources
- **State-wise domestic & foreign tourist arrivals (2016–2022)**
  Source: Ministry of Tourism, Government of India
- **Monthly foreign tourist arrivals by country & region (2018–2022)**
  Source: Ministry of Tourism, Foreign Tourist Arrivals portal

## Tools
| Tool | Purpose |
|---|---|
| R (readr, tidyverse) | Data cleaning, CSV export |
| BigQuery | Data storage, SQL analysis, joins |
| SQL | Multi-table joins, window functions, aggregations |
| Tableau | Dashboard visualization |

## Pipeline
```
Raw Ministry of Tourism CSVs 
→ R (clean, standardize state names, export)
→ BigQuery (load tables, run 4 core analysis queries)
→ Tableau (visualize 4 views: recovery map, rankings, mix, trends)
→ GitHub + LinkedIn (publish)
```

## Methodology
- **Recovery Index:** Tourist arrivals in year X as % of 2019 baseline
- **Three periods:** Pre-COVID (2019), COVID impact (2020), Recovery (2021–2022)
- **Domestic vs Foreign split:** Calculated as % of total arrivals per state
- **Ranking:** States ranked by recovery index in 2022

## Key Findings
- **Lakshadweep and small UTs show extreme recovery (>300%)** due to low 2019 baselines; driven by pent-up demand for island destinations
- **Gujarat recovered 231%** — strong rebound across both domestic and foreign tourism
- **Foreign tourist recovery lags domestic by 1–2 years** across all major states
- **Domestic tourism fully recovered by 2021** — foreign tourism still 40% below 2019 as of 2022
- **Smaller states (Himachal Pradesh, Goa)** rely 3x more on domestic tourists than foreign arrivals
- **Recovery tied to state economic size and international connectivity** — major metros (Delhi, Mumbai) and business hubs rebounded faster than smaller destinations

## Limitations
- Data limited to Ministry of Tourism official statistics (may undercount informal tourism)
- Foreign arrivals only tracked from 2018 onwards
- State-wise domestic data quality varies; smaller states less reliable
- COVID impact was not uniform across months/states
- **Population data inconsistencies:** Census 2011 (2016–2020) vs MOSPI projections (2021–2022) prevent per-capita normalization
- Small UTs show extreme percentage recoveries due to low baseline numbers
- 2023 data incomplete

## Repository Structure
```
/data/raw       — Original CSV files from Ministry of Tourism
/data/clean     — Cleaned, standardized CSVs ready for analysis
/queries        — SQL analysis queries (3 files)
/scripts        — R data cleaning script
/visuals        — Dashboard screenshot
```

## Dashboard
[View Interactive Dashboard on Tableau Public](https://public.tableau.com/views/IndiaTourismRecoveryPost-COVIDStateAnalysis/Dashboard1?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

**Dashboard shows 4 views:**
1. **States Ranked by Tourism Recovery (2022 vs 2019)** — top 10 states by recovery index
2. **Domestic vs Foreign Tourist Mix by State (2022)** — 100% stacked bar showing composition
3. **Tourism Recovery Index by State** — choropleth map of India colored by recovery
4. **National Tourism Trends: Domestic vs Foreign Arrivals** — line chart 2017–2023 showing COVID dip and recovery

## Contact
Pratham | Data Analytics Portfolio | M.Com Accounting & Finance | CA Inter
