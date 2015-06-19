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

# generate plot 3
png (file = 'plot3.png',  width = 480, height = 480)
with (power, {
  plot(Datetime, Sub_metering_1,  type = 'n', xlab = 'Weekday', ylab = 'Energy sub metering')
  lines(Datetime, Sub_metering_1, type = 'l', lwd = 2)
  lines(Datetime, Sub_metering_2, type = 'l', col = 'red', lwd = 2)
  lines(Datetime, Sub_metering_3, type = 'l', col = 'blue', lwd = 2)
  legend('topright', col = c('black', 'red', 'blue'), lty = 1, lwd = 2, legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
})
dev.off()