library(haven)
library(dplyr)
library(readr)

dir.create("temp", showWarnings = FALSE)

df <- read_dta("input/disaster_macro_V2_by_event.dta")

df_fig1 <- df %>%
  arrange(wbcode, id, year) %>%
  group_by(wbcode, id) %>%
  mutate(
    killed_pop = killed / lag(pop) * 1000000
  ) %>%
  ungroup() %>%
  filter(disaster == 1)

write_csv(df_fig1, "temp/fig1_event_data.csv")

cat("Preprocessing complete\n")
cat("======================\n")
cat("Rows:", nrow(df_fig1), "\n")
cat("Years:", min(df_fig1$year, na.rm = TRUE), "-", max(df_fig1$year, na.rm = TRUE), "\n")
cat("Mean killed_pop:", round(mean(df_fig1$killed_pop, na.rm = TRUE), 4), "\n")