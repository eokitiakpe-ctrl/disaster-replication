# preprocess.R
# Reads raw data from input/, cleans, and saves to temp/
# Part of disaster-replication pipeline
# Ese Okitiakpe, GSE 552, Spring 2026

library(haven)
library(tidyverse)

# All paths relative to repository root
input_dir <- "input"
temp_dir  <- "temp"

# Create temp/ if it doesn't exist
dir.create(temp_dir, showWarnings = FALSE)

# Load main disaster dataset
disaster <- read_dta(file.path(input_dir, "disaster_macro.dta"))

# Keep relevant variables
disaster <- disaster %>%
  select(wbcode, year, country, tot, LargeDisaster) %>%
  filter(!is.na(year)) %>%
  filter(year >= 1970 & year <= 2007)

# Collapse to year level
clean_data <- disaster %>%
  group_by(year) %>%
  summarise(
    total_events = sum(tot, na.rm = TRUE),
    large_events = sum(LargeDisaster, na.rm = TRUE),
    .groups = "drop"
  )

# Save to temp/
write_csv(clean_data, file.path(temp_dir, "clean_data.csv"))

# Console summary
cat("===== Preprocessing Summary =====\n")
cat("Sample size:", nrow(clean_data), "year-level observations\n")
cat("Year range:", min(clean_data$year), "to", max(clean_data$year), "\n")
cat("Mean total events per year:", round(mean(clean_data$total_events), 2), "\n")
cat("Mean large events per year:", round(mean(clean_data$large_events), 2), "\n")
cat("=================================\n")
