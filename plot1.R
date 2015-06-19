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

# generate plot 1
png(file = 'plot1.png', width = 480, height = 480)
hist(power$Global_active_power, col = 'red', xlab = 'Global Active Power (kilowatts)', main = 'Global Active Power' )
dev.off()