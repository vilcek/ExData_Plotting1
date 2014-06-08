## Author: Alexandre Vilcek

## Source data (household_power_consumption.txt) should be in the working directory of this R script

data <- read.table('household_power_consumption.txt', header=T, sep=';', stringsAsFactors=F)
data_to_plot <- data[(data$Date=='1/2/2007' | data$Date=='2/2/2007'),]
date_time <- paste(as.Date(data_to_plot$Date, format='%d/%m/%Y'), data_to_plot$Time)

png(file='plot4.png', width=480, height=480)

par(mfrow=c(2, 2))

plot(as.POSIXlt(date_time), as.numeric(data_to_plot$Global_active_power), xlab='', ylab='Global Active Power', type='n')
lines(as.POSIXlt(date_time), as.numeric(data_to_plot$Global_active_power))

plot(as.POSIXlt(date_time), as.numeric(data_to_plot$Voltage), xlab='datetime', ylab='Voltage', type='n')
lines(as.POSIXlt(date_time), as.numeric(data_to_plot$Voltage))

plot(as.POSIXlt(date_time), as.numeric(data_to_plot$Sub_metering_1), xlab='', ylab='Energy sub metering', type='n')
lines(as.POSIXlt(date_time), as.numeric(data_to_plot$Sub_metering_1), col='black')
lines(as.POSIXlt(date_time), as.numeric(data_to_plot$Sub_metering_2), col='red')
lines(as.POSIXlt(date_time), as.numeric(data_to_plot$Sub_metering_3), col='blue')
legend('topright', col = c('black', 'red', 'blue'), lty=c(1, 1, 1), lwd=c(1.5, 1.5, 1.5), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), bty='n')

plot(as.POSIXlt(date_time), as.numeric(data_to_plot$Global_reactive_power), xlab='datetime', ylab='Global_reactive_power', type='n')
lines(as.POSIXlt(date_time), as.numeric(data_to_plot$Global_reactive_power))

dev.off()
