
correlations <- data.frame(
  electrode = c("AF3", "F7", "F3", "T7", "FC5", "P7", "O1", "O2",
                "P8", "T8", "FC6", "F4", "F8", "AF4"),
  r = c(
    cor(my_data$psdtheta_1,  my_data$arousal), 
    cor(my_data$psdtheta_2,  my_data$arousal),
    cor(my_data$psdtheta_3,  my_data$arousal),
    cor(my_data$psdtheta_4,  my_data$arousal),
    cor(my_data$psdtheta_5,  my_data$arousal),
    cor(my_data$psdtheta_6,  my_data$arousal),
    cor(my_data$psdtheta_7,  my_data$arousal),
    cor(my_data$psdtheta_8,  my_data$arousal),
    cor(my_data$psdtheta_9,  my_data$arousal),
    cor(my_data$psdtheta_10, my_data$arousal),
    cor(my_data$psdtheta_11, my_data$arousal),
    cor(my_data$psdtheta_12, my_data$arousal),
    cor(my_data$psdtheta_13, my_data$arousal),
    cor(my_data$psdtheta_14, my_data$arousal)
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
  ggtitle("Correlation between Theta Power and Arousal")  

