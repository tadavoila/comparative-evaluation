# Install necessary packages if not already installed
install.packages("ggplot2")
install.packages("ggiraph")

# Load the necessary libraries
library(ggplot2)
library(ggiraph)

# Read the data
data <- read.csv("ucsbcovid.csv")

# Convert the Day column to a factor with the correct order
data$Day <- factor(data$Day, levels = c("Monday", "Tuesday", "Wednesday", "Thursday", "Friday"))

# Create the interactive plot using ggiraph's geom_bar_interactive
p <- ggplot(data, aes(x = Day, y = Tests, fill = Day, tooltip = Tests)) +
  geom_bar_interactive(stat = "identity") +
  scale_fill_manual(values = c("#1f77b4", "#ff7f0e", "#2ca02c", "#d62728", "#9467bd")) +
  labs(x = "Day", y = "Tests", title = "UCSB Covid Tests by Day") +
  theme_minimal()

# Convert the ggplot object to an interactive plot
interactive_plot <- girafe(ggobj = p)

# Print the interactive plot
print(interactive_plot)
