## Author: Alexandre Vilcek

## Source data (household_power_consumption.txt) should be in the working directory of this R script

data <- read.table('household_power_consumption.txt', header=T, sep=';', stringsAsFactors=F)
data_to_plot <- data[(data$Date=='1/2/2007' | data$Date=='2/2/2007'),]

png(file='plot1.png', width=480, height=480)

hist(as.numeric(data_to_plot$Global_active_power), main='Global Active Power', xlab='Global Active Power (kilowatts)', col='red')

dev.off()
