library(dplyr)
library(readr)
library(ggplot2)

dir.create("output/figures", recursive = TRUE, showWarnings = FALSE)
dir.create("output/tables", recursive = TRUE, showWarnings = FALSE)

df_fig1 <- read_csv("temp/fig1_event_data.csv", show_col_types = FALSE)

mkilled <- mean(df_fig1$killed_pop, na.rm = TRUE)

fig1_data <- df_fig1 %>%
  mutate(
    large = ifelse(!is.na(killed_pop) & killed_pop >= mkilled, 1, 0),
    event = 1
  ) %>%
  filter(year < 2008) %>%
  group_by(year) %>%
  summarise(
    total_events = sum(event),
    large_events = sum(large),
    .groups = "drop"
  )

scale_factor <- 10

p <- ggplot(fig1_data, aes(x = year)) +
  geom_line(aes(y = total_events)) +
  geom_point(aes(y = total_events), shape = 4) +
  geom_line(aes(y = large_events * scale_factor)) +
  geom_point(aes(y = large_events * scale_factor)) +
  scale_y_continuous(
    name = "Number of events",
    sec.axis = sec_axis(~ . / scale_factor, name = "Number of events")
  ) +
  labs(
    x = "",
    caption = "Note: Large events refers to events whose intensity is above the mean of the normalized killed distribution.\nSource: Authors' calculations based on EM-DAT."
  )

ggsave("output/figures/main_figure.png", p, width = 8, height = 6, dpi = 300)

summary_tex <- paste0(
  "\\begin{table}[h]\n",
  "\\centering\n",
  "\\caption{Summary Statistics for Replicated Figure 1}\n",
  "\\begin{tabular}{lcc}\n",
  "\\hline\n",
  "Statistic & Total Events & Large Events \\\\\n",
  "\\hline\n",
  "1970 & ", fig1_data$total_events[fig1_data$year == 1970], " & ", fig1_data$large_events[fig1_data$year == 1970], " \\\\\n",
  "2007 & ", fig1_data$total_events[fig1_data$year == 2007], " & ", fig1_data$large_events[fig1_data$year == 2007], " \\\\\n",
  "\\hline\n",
  "\\end{tabular}\n",
  "\\label{tab:fig1_summary}\n",
  "\\end{table}\n"
)

writeLines(summary_tex, "output/tables/main_result.tex")

cat("Analysis complete\n")
cat("=================\n")
cat("Figure saved to output/figures/main_figure.png\n")
cat("Table saved to output/tables/main_result.tex\n")
cat("Mean killed_pop threshold:", round(mkilled, 4), "\n")