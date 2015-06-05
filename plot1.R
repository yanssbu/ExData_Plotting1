install.packages('sqldf')
library(sqldf)
power <- read.csv.sql('./data/household_power_consumption.txt', sep = ';', header = TRUE, sql = "select * from file where Date in ('1/2/2007', '2/2/2007')")
closeAllConnections()

str(power)
install.packages('lubridate')
library(lubridate)
power$Datetime <- dmy_hms(paste(power$Date, power$Time))

str(power)

png(file = 'plot1.png')
hist(power$Global_active_power, col = 'red', xlab = 'Global Active Power (kilowatts)', main = 'Global Active Power' )
dev.off()