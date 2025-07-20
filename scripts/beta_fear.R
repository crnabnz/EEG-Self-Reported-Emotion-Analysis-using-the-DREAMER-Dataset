
fear_labels <- c("fear", "horror", "terror")

plot_data <- data %>%
  mutate(
    Fear_Group = ifelse(target_emotion %in% fear_labels, "Fear", "No Fear"),
    Avg_Beta = rowMeans(across(c(psdbeta_1, psdbeta_2, psdbeta_3, psdbeta_4)), na.rm = TRUE),
    Avg_Beta_z = scale(Avg_Beta)[, 1]
  )

no_fear_data <- plot_data %>% filter(Fear_Group == "No Fear")
fear_data    <- plot_data %>% filter(Fear_Group == "Fear")

ggplot() +
  geom_histogram(data = no_fear_data, aes(x = Avg_Beta_z),
                 fill = "#E69F00", bins = 30, alpha = 0.5, color = "black", position = "identity") +
  geom_histogram(data = fear_data, aes(x = Avg_Beta_z),
                 fill = "#56B4E9", bins = 30, alpha = 1.0, color = "black", position = "identity") +
  labs(
    title = "Histogram of Beta Power by Fear Condition",
    x = "Beta Power (z-scored)",
    y = "Count"
  ) +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5)
  )

  )
