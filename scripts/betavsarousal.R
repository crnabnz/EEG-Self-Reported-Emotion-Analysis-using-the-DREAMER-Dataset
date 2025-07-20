library(tidyverse)

# Load the data

df_raw <- read_csv("ml_data.csv")

# Electrode label mapping

electrode_labels <- c(
  "1" = "AF3", "2" = "F7", "3" = "F3", "4" = "FC5",
  "5" = "T7", "6" = "P7", "7" = "O1", "8" = "O2",
  "9" = "P8", "10" = "T8", "11" = "FC6", "12" = "F4",
  "13" = "F8", "14" = "AF4"
)

# Reshape beta data into long format

df_long <- df_raw %>%
  select(participant, video, arousal, starts_with("psdbeta_")) %>%
  pivot_longer(
    cols = starts_with("psdbeta_"),
    names_to = "electrode",
    values_to = "beta_power"
  ) %>%
  mutate(
    electrode = str_extract(electrode, "\\d+"),
    electrode_label = electrode_labels[electrode]
  ) %>%
  filter(!is.na(electrode_label))

# Compute Pearson correlation coefficient "r"

correlations <- df_long %>%
  group_by(electrode_label) %>%
  summarise(
    r = cor(beta_power, arousal, method = "pearson"),
    .groups = "drop"
  ) %>%
  mutate(facet_label = paste0(electrode_label, " (r = ", round(r, 2), ")"))

# Add facet labels to full dataset

df_long <- df_long %>%
  left_join(correlations %>% select(electrode_label, facet_label), by = "electrode_label")

# Plot all electrodes

ggplot(df_long, aes(x = beta_power, y = arousal)) +
  geom_jitter(alpha = 0.5, width = 0, height = 0.15, color = "steelblue", size = 2.5) +
  geom_smooth(method = "lm", se = FALSE, color = "red", linewidth = 1.5) +
  facet_wrap(~ facet_label, ncol = 4) +
  coord_cartesian(xlim = c(-2, 15)) +
  labs(
    title = "Beta Power vs Arousal Across All Electrodes",
    x = "Beta Power (μV²/Hz)",
    y = "Arousal (1–5 Scale)"
  ) +
  theme_minimal() +
  # This part is only for the adjustment to visualize the plots better
  theme(
    strip.text = element_text(size = 14, face = "bold"),
    axis.title = element_text(size = 13),
    axis.text = element_text(size = 11),
    plot.title = element_text(size = 18, face = "bold", hjust = 0.5)
  )
