getwd()


## Exploratory Data Analysis

=====================Quiz 1=========================

library(nlme)
library(lattice)
xyplot(weight ~ time | Diet, BodyWeight)

help(nlme)
help(splom)
help(trellis.par.set)

library(datasets)
library(ggplot2)
data(airquality)
head(airquality)
str(airquality)
table(airquality$Month)
airquality = transform(airquality, Month = factor(Month))
qplot(Wind, Ozone, data = airquality, facets = . ~ Month, smooth = 'loess')
qplot(Wind, Ozone, data = airquality, facets = . ~ Month) + stats_smooth('loess')


head(airquality)
hist(airquality$Ozone)
with(airquality, plot(Wind, Ozone))
par('lty')
par('mar')
par('mar' = c(3.1, 4.1, 3.1, 2.1))
boxplot(Ozone ~ Month, airquality, xlab = 'Month', ylab = 'Ozone(ppb)')

with (airquality, plot(Wind, Ozone, main = 'Ozone and Wind in New York City',  type = 'n'))
with (subset(airquality, Month == 5), points(Wind, Ozone, col = 'blue'))
with (subset(airquality, Month != 5), points(Wind, Ozone, col = 'red'))
legend('topright', pch = 1, col = c('blue', 'red'), legend = c('May', 'Other Months'))

par(mfrow = c(1,2))
with (airquality, {
  plot (Wind, Ozone, main = 'Ozone and Wind')
  plot (Solar.R, Ozone, main = 'Ozone and Solar Radiation')
})

par(mfrow = c(1,3), mar = c(4,4,2,1), oma=c(0,0,2,0))
with (airquality, {
  plot(Wind, Ozone, main = 'Ozone and Wind', pch =19, col = 'steelblue', abline(lm(Ozone ~ Wind), lwd = 3, col = 'red'))
  plot(Solar.R, Ozone, main = 'Ozone and Solar Radiation', pch = 19, col = 'steelblue', xlim = c(0, 300), abline(lm(Solar.R ~ Ozone), lwd = 3, col = 'red'))
  plot(Temp, Ozone, main = 'Ozone and Temperature', pch = 19, col = 'steelblue', xlim = c(0, 100), abline(lm(Temp ~ Ozone), lwd = 3, col = 'red'))
  mtext('Ozone and Weather in New York City', outer = TRUE)
})

par (mfrow = c(1,1))
x = rnorm(100)
y = x + rnorm(100)
plot(x, y)
g = gl(2, 50, labels = c('male', 'female'))
str(g)
plot(x, y, type = 'n')
points(x[g == 'male'], y[g == 'male'], col = 'green', pch = 19)
points(x[g == 'female'], y[g =='female'], col = 'red', pch = 19)
legend ('topleft', pch = 19, col = c('green', 'red'), legend = c('male', 'female'))

=================== project 1 ===========================
  
  install.packages('sqldf')
library(sqldf)
power <- read.csv.sql('./data/household_power_consumption.txt', sep = ';', header = TRUE, sql = "select * from file where Date in ('1/2/2007', '2/2/2007')")
closeAllConnections()
str(power)
install.packages('lubridate')
library(lubridate)
library(dplyr)
power$Datetime <- dmy_hms(paste(power$Date, power$Time))
power1 <- mutate(power, Wday = wday(power$Datetime, label = TRUE))
head(power)
str(power1)

png(file = 'plot1.png')
hist(power$Global_active_power, col = 'red', xlab = 'Global Active Power (kilowatts)', main = 'Global Active Power' )
dev.off()

png(file = 'plot2.png')
plot(power$Datetime, power$Global_active_power, type = 'l', xlab = 'Weekday', ylab = 'Global Active Power (kilowatts)')
dev.off()

png (file = 'plot3.png')
with (power, {
  plot(Datetime, Sub_metering_1,  type = 'n', xlab = 'Weekday', ylab = 'Energy sub metering')
  lines(Datetime, Sub_metering_1, type = 'l', lwd = 2)
  lines(Datetime, Sub_metering_2, type = 'l', col = 'red', lwd = 2)
  lines(Datetime, Sub_metering_3, type = 'l', col = 'blue', lwd = 2)
  legend('topright', col = c('black', 'red', 'blue'), lty = 1, lwd = 2, legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'))
})
dev.off()

png (file = 'plot4.png')
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


? plot
?legend
