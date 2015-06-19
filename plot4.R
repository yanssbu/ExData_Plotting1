# install and load packages
install.packages('sqldf')
install.packages('lubridate')

library(sqldf)
library(lubridate)

# load patial data meet the requirement
power <- read.csv.sql('./data/household_power_consumption.txt', sep = ';', header = TRUE, sql = "select * from file where Date in ('1/2/2007', '2/2/2007')")
closeAllConnections()

# generate a new column with datetime
power$Datetime <- dmy_hms(paste(power$Date, power$Time))

# generate plot 4
png (file = 'plot4.png', width = 480, height = 480)
par(mfrow = c(2,2))
with (power, {
  plot (Datetime, Global_active_power, type = 'l', xlab = '', ylab = 'Global Active Power', lwd = 2 )
  plot (Datetime, Voltage, type = 'l', xlab = 'datetime', ylab = 'Voltage')
  plot (Datetime, Sub_metering_1,  type = 'n', xlab = '', ylab = 'Energy sub metering')
  lines(Datetime, Sub_metering_1, type = 'l', lwd = 2)
  lines(Datetime, Sub_metering_2, type = 'l', col = 'red', lwd = 2)
  lines(Datetime, Sub_metering_3, type = 'l', col = 'blue', lwd = 2)
  legend('topright', bty = 'n', cex = 0.75, col = c('black', 'red', 'blue'), lty = 1, lwd = 2, legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
  plot (Datetime, Global_reactive_power, type = 'l', xlab = 'datetime')
})
dev.off()