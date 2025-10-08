# R visualization with ggplot2
# Install packages if needed: install.packages(c("ggplot2", "gridExtra", "scales"))

library(ggplot2)
library(gridExtra)
library(scales)

# Data
months <- c('Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
           'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec')

# G0 = Extraterrestial Solar Radiation
G0 <- c(575.23, 687.15, 814.34, 934.69, 1002.40, 1026.65, 
        1014.34, 959.27, 852.72, 713.18, 595.15, 541.45)

# h = Bright sunshine hours
h <- c(8.29, 8.47, 8.11, 6.95, 6.44, 4.23, 
       3.94, 5.13, 5.28, 7.80, 8.73, 8.36)

# N = Maximum possible sunshine duration
N <- c(9.82, 10.43, 11.13, 11.88, 12.46, 12.73,
       12.58, 12.07, 11.35, 10.60, 9.93, 9.62)

# W = Absolute humidity
W <- c(10.96, 11.30, 14.20, 17.33, 19.47, 22.08,
       22.48, 22.70, 22.10, 19.95, 15.60, 12.39)

# R = Relative humidity
R <- c(70.67, 69.10, 66.10, 75.11, 81.70, 86.70,
       87.50, 85.50, 86.22, 82.30, 75.30, 73.90)

# Calculate derived values
G <- G0*(0.394 + (0.364* (h/(N^2)) * 0.0035*W))
D <- G0*(0.306 - (0.165*(h/(N^2))) + 0.0025*W)
B <- G - D

# Create month factor for proper ordering
month_factor <- factor(months, levels = months)

# Graph 1: Radiation components with facet wrap
df1 <- data.frame(
  Month = rep(month_factor, 3),
  Value = c(G, D, B),
  Type = rep(c("Total Solar Radiation (G)", "Diffuse Radiation (D)", "Direct Beam (B = G - D)"), each = 12)
)

plot1 <- ggplot(df1, aes(x = Month, y = Value, color = Type, group = Type)) +
  geom_line(size = 1.2) +
  geom_point(size = 3, shape = 21, fill = "white", stroke = 1.5) +
  scale_color_manual(values = c("Total Solar Radiation (G)" = "#E74C3C",
                                "Diffuse Radiation (D)" = "#27AE60",
                                "Direct Beam (B = G - D)" = "#3498DB")) +
  labs(title = "Monthly Variation of Solar Radiation Components",
       subtitle = "Analysis of G, D, and B across 12 months",
       x = "Month",
       y = "Radiation (W/m²)",
       color = "Component") +
  theme_minimal(base_size = 12) +
  theme(
    plot.title = element_text(face = "bold", size = 16, hjust = 0.5),
    plot.subtitle = element_text(hjust = 0.5, color = "gray40"),
    panel.grid.minor = element_blank(),
    panel.grid.major = element_line(linetype = "dashed", alpha = 0.5),
    legend.position = "bottom",
    axis.text.x = element_text(angle = 45, hjust = 1)
  )

# Graph 2: Input variables with dual axis approach using facets
df2 <- data.frame(
  Month = rep(month_factor, 4),
  Value = c(R, h, N, W),
  Variable = factor(rep(c("Relative Humidity (%)", "Bright Sunshine (h)", 
                         "Max Sunshine Duration (N)", "Absolute Humidity (W)"), each = 12),
                   levels = c("Relative Humidity (%)", "Bright Sunshine (h)", 
                             "Max Sunshine Duration (N)", "Absolute Humidity (W)"))
)

plot2 <- ggplot(df2, aes(x = Month, y = Value, group = 1)) +
  geom_area(fill = "#3498DB", alpha = 0.3) +
  geom_line(color = "#2C3E50", size = 1) +
  geom_point(size = 2.5, color = "#E74C3C") +
  facet_wrap(~ Variable, scales = "free_y", ncol = 2) +
  labs(title = "Monthly Variation of Input Variables",
       subtitle = "Multi-panel view of humidity and sunshine parameters",
       x = "Month",
       y = "Value") +
  theme_minimal(base_size = 11) +
  theme(
    plot.title = element_text(face = "bold", size = 16, hjust = 0.5),
    plot.subtitle = element_text(hjust = 0.5, color = "gray40"),
    panel.grid.minor = element_blank(),
    strip.background = element_rect(fill = "#ECF0F1", color = NA),
    strip.text = element_text(face = "bold", size = 10),
    axis.text.x = element_text(angle = 45, hjust = 1)
  )

# Graph 3: Heatmap visualization - BONUS!
df_heatmap <- data.frame(
  Month = month_factor,
  G0 = G0,
  h = h,
  N = N,
  W = W,
  R = R,
  G = G,
  D = D,
  B = B
)

# Normalize for heatmap
df_heat_normalized <- df_heatmap
df_heat_normalized[, -1] <- scale(df_heat_normalized[, -1])

# Reshape for heatmap
library(reshape2)
df_melt <- melt(df_heat_normalized, id.vars = "Month")

plot3 <- ggplot(df_melt, aes(x = variable, y = Month, fill = value)) +
  geom_tile(color = "white", size = 0.5) +
  scale_fill_gradient2(low = "#3498DB", mid = "white", high = "#E74C3C", 
                       midpoint = 0, name = "Normalized\nValue") +
  geom_text(aes(label = sprintf("%.1f", value)), size = 3) +
  labs(title = "Solar Radiation Data Heatmap (Normalized)",
       subtitle = "Comparative view across all variables",
       x = "Variable",
       y = "Month") +
  theme_minimal(base_size = 12) +
  theme(
    plot.title = element_text(face = "bold", size = 16, hjust = 0.5),
    plot.subtitle = element_text(hjust = 0.5, color = "gray40"),
    axis.text.x = element_text(angle = 45, hjust = 1),
    panel.grid = element_blank()
  )

# Display all plots
print(plot1)
readline(prompt="Press [enter] to continue to next plot")

print(plot2)
readline(prompt="Press [enter] to continue to next plot")

print(plot3)

# Save plots
ggsave("radiation_components_R.png", plot1, width = 12, height = 7, dpi = 300)
ggsave("input_variables_R.png", plot2, width = 12, height = 10, dpi = 300)
ggsave("heatmap_R.png", plot3, width = 10, height = 8, dpi = 300)

cat("\n✓ Plots saved as PNG files!\n")

