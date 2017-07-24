library(lubridate)
library(lubridate)
library(ggplot2)   # use at least 0.9.3 for theme_minimal()

# get data
data <- read.csv("<file path with // escape>Data.csv", header=TRUE)

data$.DayOfWeek <- as.factor(data$DayOfWeek)
data$.Hour <- as.factor(data$Hour)

# get the graph
ggplot(data, aes(x = Hour + 1, fill = .DayOfWeek)) + geom_histogram(breaks = seq(0, 
    24), colour = "grey") + coord_polar(start = 0) + theme_minimal() + 
    ylab("Count") + ggtitle("Access Breakdown by Time and Day of Week") + 
    scale_x_continuous("", limits = c(0, 24), breaks = seq(0, 24), labels = seq(0, 
        24)) +
    scale_fill_discrete("Day of week", 
                      labels=c("Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"))

#output the file
ggsave('<output file>Output_PNG.png')
