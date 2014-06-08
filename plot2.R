## Author: Alexandre Vilcek

## Source data (household_power_consumption.txt) should be in the working directory of this R script

data <- read.table('household_power_consumption.txt', header=T, sep=';', stringsAsFactors=F)
data_to_plot <- data[(data$Date=='1/2/2007' | data$Date=='2/2/2007'),]
date_time <- paste(as.Date(data_to_plot$Date, format='%d/%m/%Y'), data_to_plot$Time)

png(file='plot2.png', width=480, height=480)

plot(as.POSIXlt(date_time), as.numeric(data_to_plot$Global_active_power), xlab='', ylab='Global Active Power (kilowatts)', type='n')
lines(as.POSIXlt(date_time), as.numeric(data_to_plot$Global_active_power))

dev.off()
