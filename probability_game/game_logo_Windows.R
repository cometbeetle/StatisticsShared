# Install and load the libraries
install.packages(c('tidyverse', 'geomtextpath', 'magick'), repos='https://cran.microsoft.com')

library(ggplot2)
library(geomtextpath)
library(magick)

# Define the number of points
points <- 2000

# Define the angle
angle <- pi/2 + 0.001

# Spiral dataset
t <- (1:points) * angle
x_spiral <- cos(t)
y_spiral <- sin(t)

# Half-circle top dataset
r <- 750
x_temp <- seq(-r, r)
x_circle <- x_temp * 1.25 # stretch x values
y_circle <- sqrt(r^2 - x_temp^2) - 200

# Half-circle bottom
y_circle_b <- -sqrt(r^2 - x_temp^2) + 200

# Eye parabola top section dataset
x_temp <- -18:18
x_par <- x_temp * 35 # stretch x values
y_par <- -x_temp^2 + 324

# Bottom of eye parabola
y_par_b <- x_temp^2 - 324

# Create dataframes
spiral <- data.frame(t, x_spiral, y_spiral)
circle <- data.frame(x_circle, y_circle, y_circle_b)
eye <- data.frame(x_par, y_par, y_par_b)

# Object containing plot theme settings to remove axes, labels, etc.
remove_axes <- theme(panel.background = element_rect(fill='white'),
                     panel.grid = element_blank(),
                     axis.ticks = element_blank(),
                     axis.title = element_blank(),
                     axis.text = element_blank())

# Make the plot with ggplot2
plt <- ggplot() +
  # Remove axes, labels, etc.
  remove_axes + 
  
  # Points layer 1 using spiral dataframe
  geom_point(data = spiral, aes(x_spiral*t, y_spiral*t), 
             size = 80, alpha = 0.1, shape = 1, color = "#1c51ff") + 
  
  # Eye parabola top layer
  geom_path(data = eye, aes(x_par, y_par),
            linewidth = 2) + 
  # Eye parabola bottom layer
  geom_path(data = eye, aes(x_par, y_par_b),
            linewidth = 2) +
  
  # Eye center
  geom_point(aes(0, 0), size=15) +
  
  # Upper curved text layer using half-circle dataframe
  geom_textpath(data = circle, aes(x_circle, y_circle), 
                size = 6, label = "S E C O N D", 
                text_only = TRUE, fontface = "bold") +
  # Lower curved text
  geom_textpath(data = circle, aes(x_circle, y_circle_b), 
                size = 6, label = "S I G H T", 
                text_only = TRUE, fontface = "bold")


# Save high-resolution image
cat("\nSaving image file...\n")

ggsave("second_sight.png", plot = plt, dpi = 500, width = 7 , height = 7, type = "cairo") # IF USING MacOS: remove argument 'type = "cairo"' from ggsave() call

cat(paste("\nHigh-resolution logo image saved to: '", getwd(), "/second_sight.png'", sep = ""))

# Read and display saved PNG file using magick package
img <- image_scale(image_read('second_sight.png'), "512")

print(img, info=FALSE)

cat(paste("\nPlease note: this image is only 512x512.\n\nFor image use, please see the full-res version at: '", getwd(), "/second_sight.png'", sep = ""))