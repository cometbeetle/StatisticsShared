# Script for displaying a probability distribution table with geom_bar.
# Dplyr is used to factor the x_vales to avoid extra x-axis spacing.

# Import libraries
library(ggplot2)
library(dplyr)

# Set values of random variable and their respective probabilities
x_values <- c(-2, -1, 0, 1, 2)
probs <- c(0.25, 0.125, 0.25, 0.25, 0.125)

# Create data frame with these data
probdistro <- data.frame(x_values, probs)

# Factor the x_values to make each value categorical (avoids extra space)
probdistro$x_values <- factor(probdistro$x_values, levels = probdistro$x_values)

# Create plot using probdistro data frame
ggplot(probdistro, aes(x_values, probs)) + 
  
  # Use geom_bar with stat = "identity"
  # This allows manual y-values to be used with geom_bar along with the x_values
  geom_bar(stat = "identity", fill="darkblue", width=0.75) + 
  
  # Rename y-axis and x-axis labels
  ylab('probability') + xlab('values of random variable X') + 
  
  # Change text size as desired
  theme(axis.text=element_text(size=14), 
        axis.title=element_text(size=18), 
        plot.title=element_text(size=25)) + 
  
  # Add title as desired
  ggtitle('Second Sight Probability Distribution')



