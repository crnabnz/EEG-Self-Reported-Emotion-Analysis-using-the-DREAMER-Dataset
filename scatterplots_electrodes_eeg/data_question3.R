library(tidyverse)

# Load data

df_raw <- read_csv("ml_data.csv")

# Electrode name mapping

electrode_labels <- c(
  "1" = "AF3", "2" = "F7", "3" = "F3", "4" = "FC5",
  "5" = "T7", "6" = "P7", "7" = "O1", "8" = "O2",
  "9" = "P8", "10" = "T8", "11" = "FC6", "12" = "F4",
  "13" = "F8", "14" = "AF4"
)
# Prepare the data

df_theta <- df_raw %>%
  select(participant, video, dominance, starts_with("psdtheta_")) %>%
  pivot_longer(
    cols = starts_with("psdtheta_"),
    names_to = "electrode",
    values_to = "theta_power"
  ) %>%
  mutate(
    electrode = str_extract(electrode, "\\d+"),
    electrode_label = electrode_labels[electrode]
  ) %>%
  filter(!is.na(electrode_label))

# Calculate Pearson correlation coefficient "r" per electrode

cor_vals <- df_theta %>%
  group_by(electrode_label) %>%
  summarise(r = cor(theta_power, dominance, method = "pearson")) %>%
  mutate(label_with_r = paste0(electrode_label, " (r = ", round(r, 2), ")"))

# Merge correlation labels into full dataset

df_theta <- df_theta %>%
  left_join(cor_vals %>% select(electrode_label, label_with_r), by = "electrode_label")


# Plot scatter plots for all electrodes

ggplot(df_theta, aes(x = theta_power, y = dominance)) +
  geom_point(alpha = 0.5, color = "darkmagenta", size = 3.5) +
  geom_smooth(method = "lm", color = "red", se = FALSE, linewidth = 2) +
  facet_wrap(~ label_with_r, ncol = 4) +
  coord_cartesian(xlim = c(0, 15)) +
  labs(
    title = "Theta Power vs Dominance Across All Electrodes",
    x = "Theta Power (μV²/Hz)",
    y = "Dominance (1–5 Scale)"
  ) +
  theme_minimal() +
  # This part is only for the adjustment to visualize the plots better
  theme(
    strip.text = element_text(size = 14, face = "bold"),
    axis.title = element_text(size = 13),
    axis.text = element_text(size = 11),
    plot.title = element_text(size = 18, face = "bold", hjust = 0.5)
  )
