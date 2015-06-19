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

# generate plot2
png(file = 'plot2.png', width = 480, height = 480)
plot(power$Datetime, power$Global_active_power, type = 'l', xlab = 'Weekday', ylab = 'Global Active Power (kilowatts)')
dev.off()