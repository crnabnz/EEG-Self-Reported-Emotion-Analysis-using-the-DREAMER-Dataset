fear_labels <- c("fear", "horror", "terror")

plot_data <- data %>%
  mutate(
    Fear_Group = ifelse(target_emotion %in% fear_labels, "Fear", "No Fear"),
    Avg_Alpha = rowMeans(across(c(psdalpha_1, psdalpha_2, psdalpha_3, psdalpha_4)), na.rm = TRUE),
    Avg_Alpha_z = scale(Avg_Alpha)[, 1]
  )

no_fear_data <- plot_data %>% filter(Fear_Group == "No Fear")
fear_data    <- plot_data %>% filter(Fear_Group == "Fear")

ggplot() +
  geom_histogram(data = no_fear_data, aes(x = Avg_Alpha_z),
                 fill = "#E69F00", bins = 30, alpha = 0.5, color = "black", position = "identity") +
  geom_histogram(data = fear_data, aes(x = Avg_Alpha_z),
                 fill = "#56B4E9", bins = 30, alpha = 1.0, color = "black", position = "identity") +
  labs(
    title = "Histogram of Alpha Power by Fear Condition",
    x = "Alpha Power (z-scored)",
    y = "Count"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5)
  )