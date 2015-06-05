png(file = 'plot2.png')
plot(power$Datetime, power$Global_active_power, type = 'l', xlab = 'Weekday', ylab = 'Global Active Power (kilowatts)')
dev.off()