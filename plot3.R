library(lubridate)
library(plyr)
library(dplyr)

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data$Date <- dmy(data$Date)
data2 <- filter(data, data$Date == ymd("2007-02-01") | data$Date == ymd("2007-02-02"))
data2 <- mutate(data2, DateTime = ymd(Date) + hms(Time))

png(file = "plot3.png")

plot(data2$DateTime, data2$Sub_metering_1, type = "l", ylim = c(0,40),
     cex.axis = 0.75, cex.lab = 0.75,
     xlab = "", ylab = "Energy Sub metering")
par(new=T)
plot(data2$DateTime, data2$Sub_metering_2, type = "l", ylim = c(0,40),
     cex.axis = 0.75, cex.lab = 0.75,
     col = "red", xlab = "", ylab = "")
par(new=T)
plot(data2$DateTime, data2$Sub_metering_3, type = "l", ylim = c(0,40),
     cex.axis = 0.75, cex.lab = 0.75,
     col = "blue", xlab = "", ylab = "")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", 
      "Sub_metering_3"), cex = 0.85, col = c("black", "red", "blue"), lty = c(1, 1, 1))
#dev.copy(png, file = "plot3.png")
dev.off()

