
correlations <- data.frame(
  electrode = c("AF3", "F7", "F3", "T7", "FC5", "P7", "O1", "O2",
                "P8", "T8", "FC6", "F4", "F8", "AF4"),
  r = c(
    cor(my_data$psdbeta_1,  my_data$valence),  
    cor(my_data$psdbeta_2,  my_data$valence),
    cor(my_data$psdbeta_3,  my_data$valence),
    cor(my_data$psdbeta_4,  my_data$valence),
    cor(my_data$psdbeta_5,  my_data$valence),
    cor(my_data$psdbeta_6,  my_data$valence),
    cor(my_data$psdbeta_7,  my_data$valence),
    cor(my_data$psdbeta_8,  my_data$valence),
    cor(my_data$psdbeta_9,  my_data$valence),
    cor(my_data$psdbeta_10, my_data$valence),
    cor(my_data$psdbeta_11, my_data$valence),
    cor(my_data$psdbeta_12, my_data$valence),
    cor(my_data$psdbeta_13, my_data$valence),
    cor(my_data$psdbeta_14, my_data$valence)
  )
)


correlations <- merge(correlations, electrode_locations, by = "electrode")
correlations <- correlations |>
  dplyr::rename(amplitude = r)


topoplot(
  data = correlations,
  channel = "electrode",
  value = "r", 
  interp_limit = "head",
  grid_res = 200,
  palette = "RdBu",
  limits = c(-0.2, 0.2),
  contour = TRUE
) + 
  labs(fill = "Pearson's r") +
  ggtitle("Correlation between Beta Power and Valence")  
