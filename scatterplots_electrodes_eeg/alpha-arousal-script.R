


AF3_data <- data.frame(alpha_power = my_data$psdalpha_1,  arousal = my_data$arousal, electrode = "AF3")
F7_data  <- data.frame(alpha_power = my_data$psdalpha_2,  arousal = my_data$arousal, electrode = "F7")
F3_data  <- data.frame(alpha_power = my_data$psdalpha_3,  arousal = my_data$arousal, electrode = "F3")
T7_data  <- data.frame(alpha_power = my_data$psdalpha_4,  arousal = my_data$arousal, electrode = "T7")
FC5_data <- data.frame(alpha_power = my_data$psdalpha_5,  arousal = my_data$arousal, electrode = "FC5")
P7_data  <- data.frame(alpha_power = my_data$psdalpha_6,  arousal = my_data$arousal, electrode = "P7")
O1_data  <- data.frame(alpha_power = my_data$psdalpha_7,  arousal = my_data$arousal, electrode = "O1")
O2_data  <- data.frame(alpha_power = my_data$psdalpha_8,  arousal = my_data$arousal, electrode = "O2")
P8_data  <- data.frame(alpha_power = my_data$psdalpha_9,  arousal = my_data$arousal, electrode = "P8")
T8_data  <- data.frame(alpha_power = my_data$psdalpha_10, arousal = my_data$arousal, electrode = "T8")
FC6_data <- data.frame(alpha_power = my_data$psdalpha_11, arousal = my_data$arousal, electrode = "FC6")
F4_data  <- data.frame(alpha_power = my_data$psdalpha_12, arousal = my_data$arousal, electrode = "F4")
F8_data  <- data.frame(alpha_power = my_data$psdalpha_13, arousal = my_data$arousal, electrode = "F8")
AF4_data <- data.frame(alpha_power = my_data$psdalpha_14, arousal = my_data$arousal, electrode = "AF4")

t
plot_electrode <- function(data) {
  ggplot(data, aes(x = alpha_power, y = arousal)) +
    geom_point(alpha = 0.6, color = "steelblue") +
    geom_smooth(method = "lm", se = FALSE, color = "darkred") +
    stat_cor(method = "pearson", label.x = -2, label.y = 5.5, size = 3.5) +
    labs(
      title = paste(unique(data$electrode)),
      x = "Alpha Power",
      y = "Arousal"
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

