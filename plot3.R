png (file = 'plot3.png')
with (power, {
  plot(Datetime, Sub_metering_1,  type = 'n', xlab = 'Weekday', ylab = 'Energy sub metering')
  lines(Datetime, Sub_metering_1, type = 'l', lwd = 2)
  lines(Datetime, Sub_metering_2, type = 'l', col = 'red', lwd = 2)
  lines(Datetime, Sub_metering_3, type = 'l', col = 'blue', lwd = 2)
  legend('topright', col = c('black', 'red', 'blue'), lty = 1, lwd = 2, legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
})
dev.off()