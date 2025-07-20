library(ggplot2)
library(ggpubr)
library(gridExtra)


AF3_data <- data.frame(beta_power = my_data$psdbeta_1,  valence = my_data$valence, electrode = "AF3")
F7_data  <- data.frame(beta_power = my_data$psdbeta_2,  valence = my_data$valence, electrode = "F7")
F3_data  <- data.frame(beta_power = my_data$psdbeta_3,  valence = my_data$valence, electrode = "F3")
T7_data  <- data.frame(beta_power = my_data$psdbeta_4,  valence = my_data$valence, electrode = "T7")
FC5_data <- data.frame(beta_power = my_data$psdbeta_5,  valence = my_data$valence, electrode = "FC5")
P7_data  <- data.frame(beta_power = my_data$psdbeta_6,  valence = my_data$valence, electrode = "P7")
O1_data  <- data.frame(beta_power = my_data$psdbeta_7,  valence = my_data$valence, electrode = "O1")
O2_data  <- data.frame(beta_power = my_data$psdbeta_8,  valence = my_data$valence, electrode = "O2")
P8_data  <- data.frame(beta_power = my_data$psdbeta_9,  valence = my_data$valence, electrode = "P8")
T8_data  <- data.frame(beta_power = my_data$psdbeta_10, valence = my_data$valence, electrode = "T8")
FC6_data <- data.frame(beta_power = my_data$psdbeta_11, valence = my_data$valence, electrode = "FC6")
F4_data  <- data.frame(beta_power = my_data$psdbeta_12, valence = my_data$valence, electrode = "F4")
F8_data  <- data.frame(beta_power = my_data$psdbeta_13, valence = my_data$valence, electrode = "F8")
AF4_data <- data.frame(beta_power = my_data$psdbeta_14, valence = my_data$valence, electrode = "AF4")


plot_electrode <- function(data) {
  ggplot(data, aes(x = beta_power, y = valence)) +
    geom_point(alpha = 0.6, color = "steelblue") +
    geom_smooth(method = "lm", se = FALSE, color = "darkred") +
    stat_cor(method = "pearson", label.x = -2, label.y = 5.5, size = 3.5) +
    labs(
      title = paste(unique(data$electrode)),
      x = "Beta Power",
      y = "Valence"
    ) +
    theme_minimal()
}


p1 <- plot_electrode(AF3_data)
p2 <- plot_electrode(F7_data)
p3 <- plot_electrode(F3_data)
p4 <- plot_electrode(T7_data)
p5 <- plot_electrode(FC5_data)
p6 <- plot_electrode(P7_data)
p7 <- plot_electrode(O1_data)
p8 <- plot_electrode(O2_data)
p9 <- plot_electrode(P8_data)
p10 <- plot_electrode(T8_data)
p11 <- plot_electrode(FC6_data)
p12 <- plot_electrode(F4_data)
p13 <- plot_electrode(F8_data)
p14 <- plot_electrode(AF4_data)


grid.arrange(p1, p2, p3, p4,
             p5, p6, p7, p8,
             p9, p10, p11, p12,
             p13, p14,
             ncol = 4)

