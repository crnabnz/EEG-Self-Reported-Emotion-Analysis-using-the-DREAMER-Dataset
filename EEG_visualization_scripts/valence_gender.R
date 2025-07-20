gender_colors <- c("female" = "#FBB4B9", "male" = "#B3CDE3")

ggplot(data, aes(x = gender, y = valence, fill = gender)) +
  geom_violin(trim = FALSE, alpha = 0.6) +
  geom_boxplot(width = 0.1, outlier.shape = NA) +
  scale_fill_manual(values = gender_colors) +
  labs(title = "Valence Ratings by Gender", x = "Gender", y = "Valence") +
  theme_minimal() +
  theme(legend.position = "none")
