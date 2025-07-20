
correlations <- data.frame(
  electrode = c("AF3", "F7", "F3", "T7", "FC5", "P7", "O1", "O2",
                "P8", "T8", "FC6", "F4", "F8", "AF4"),
  r = c(
    cor(my_data$psdalpha_1,  my_data$arousal), 
    cor(my_data$psdalpha_2,  my_data$arousal),
    cor(my_data$psdalpha_3,  my_data$arousal),
    cor(my_data$psdalpha_4,  my_data$arousal),
    cor(my_data$psdalpha_5,  my_data$arousal),
    cor(my_data$psdalpha_6,  my_data$arousal),
    cor(my_data$psdalpha_7,  my_data$arousal),
    cor(my_data$psdalpha_8,  my_data$arousal),
    cor(my_data$psdalpha_9,  my_data$arousal),
    cor(my_data$psdalpha_10, my_data$arousal),
    cor(my_data$psdalpha_11, my_data$arousal),
    cor(my_data$psdalpha_12, my_data$arousal),
    cor(my_data$psdalpha_13, my_data$arousal),
    cor(my_data$psdalpha_14, my_data$arousal)
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
  ggtitle("Correlation between Alpha Power and Arousal")  

