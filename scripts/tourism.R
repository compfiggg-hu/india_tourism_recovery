library(tidyverse)
install.packages('dplyr')
library(dplyr)
library(readxl)

# Load files
fta_country <- read_csv('/kaggle/input/datasets/compfigggfg/tourism-dataset/fta_by_country_annual(2018-2022).csv')
fta_region <- read_csv('/kaggle/input/datasets/compfigggfg/tourism-dataset/fta_by_region_annual.csv')
fta_monthly <- read_csv('/kaggle/input/datasets/compfigggfg/tourism-dataset/montly_fta.csv')
state_tourism <- read_csv('/kaggle/input/datasets/compfigggfg/tourism-dataset/state_wise_tourism_data.csv')

# Quick inspection
str(fta_country)
str(state_tourism)
str(fta_monthly)
str(fta_region)

# 1. FIX STATE DATA (first row is header, remove it)
state_raw <- state_tourism
# Manually set column names from first data row
state_clean <- state_raw %>%
  slice(-1) %>%  # Remove first row (it's header)
  setNames(c("year", "state", "domestic_tourists", "foreign_tourists", 
             "col5", "col6", "col7", "col8", "col9")) %>%
  select(year, state, domestic_tourists, foreign_tourists) %>%
  mutate(
    year = as.numeric(year),
    domestic_tourists = as.numeric(gsub(",", "", domestic_tourists)),
    foreign_tourists = as.numeric(gsub(",", "", foreign_tourists))
  ) %>%
  filter(!is.na(year), !is.na(state))

# 2. FIX COUNTRY DATA
fta_country_clean <- fta_country %>% 
  mutate(
    fta_count = as.numeric(gsub(",", "", fta_count)), # Also fixed a small typo here: replaced " " with "" to properly remove commas
    country = Country, 
    year = Year
  ) %>% 
  select(country, year, foreign_tourists = fta_count) %>% 
  filter(!is.na(foreign_tourists)) # <-- Change fta_count to foreign_tourists here

# 3. FIX REGION DATA
fta_region_clean <- fta_region %>%
  mutate(
    fta_count = as.numeric(gsub(",", "", fta_count))
  ) %>%
  rename(foreign_tourists = fta_count) %>%
  select(region, year, foreign_tourists) %>%
  filter(!is.na(foreign_tourists))

# 4. FIX MONTHLY DATA
fta_monthly_clean <- fta_monthly %>%
  select(year = 'year', month = 'month', fta_count) %>%
  mutate(
    year = as.numeric(year),
    fta_count = as.numeric(gsub(",", "", fta_count))
  ) %>%
  filter(!is.na(year), !is.na(month)) %>%
  select(-contains("Unnamed"))

# EXPORT ALL
write_csv(state_clean, "state_wise_clean.csv")
write_csv(fta_country_clean, "fta_country_clean.csv")
write_csv(fta_region_clean, "fta_region_clean.csv")
write_csv(fta_monthly_clean, "fta_monthly_clean.csv")
cat("All 4 files cleaned and exported.\n")
