# Script for displaying a probability distribution table with geom_bar.
# Dplyr is used to factor the x_vales to avoid extra x-axis spacing.

# Import libraries
library(ggplot2)
library(dplyr)

# ---------------------------------------------------
# ------------- THEORETICAL PROBABILITY -------------
# ---------------------------------------------------

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
        plot.title=element_text(size=20)) + 
  
  # Add title as desired
  ggtitle('Second Sight Probability Distribution (Theoretical)')



# -------------------------------------------------
# ------------- EMPIRICAL PROBABILITY -------------
# -------------------------------------------------

# Set values of random variable and import the empirical data
x_values <- c(-2, -1, 0, 1, 2)
probs <- c(20, 15, 22, 25, 17)

# Make probabilities using the empirical data
probs <- c(20/sum(probs), 15/sum(probs), 22/sum(probs), 25/sum(probs), 17/sum(probs))

# Create data frame with these data
probdistro_emp <- data.frame(x_values, probs)

# Factor the x_values to make each value categorical (avoids extra space)
probdistro_emp$x_values <- factor(probdistro_emp$x_values, levels = probdistro_emp$x_values)

# Create plot using probdistro_emp data frame
ggplot(probdistro_emp, aes(x_values, probs)) + 
  
  # Use geom_bar with stat = "identity"
  # This allows manual y-values to be used with geom_bar along with the x_values
  geom_bar(stat = "identity", fill="darkblue", width=0.75) + 
  
  # Rename y-axis and x-axis labels
  ylab('probability') + xlab('values of random variable X') + 
  
  # Change text size as desired
  theme(axis.text=element_text(size=14), 
        axis.title=element_text(size=18), 
        plot.title=element_text(size=20)) + 
  
  # Add title as desired
  ggtitle('Second Sight Probability Distribution (Empirical)')


