library(lubridate)
library(plyr)
library(dplyr)

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data$Date <- dmy(data$Date)
data2 <- filter(data, data$Date == ymd("2007-02-01") | data$Date == ymd("2007-02-02"))
data2 <- mutate(data2, DateTime = ymd(Date) + hms(Time))

png(file = "plot4.png")

par(mfrow = c(2,2))

plot(data2$DateTime, data2$Global_active_power, cex.lab = 1 , cex.axis = 1, 
     ylab = "Global Active Power", type = "l", xlab = "")

plot(data2$DateTime, data2$Voltage, type = "l", xlab = "datetime", ylab = "Voltage", 
     cex.axis = 1, cex.lab = 1)


plot(data2$DateTime, data2$Sub_metering_1, type = "l", ylim = c(0,40),
     cex.axis = 1, cex.lab = 1,
     xlab = "", ylab = "Energy Sub metering")
par(new=T)
plot(data2$DateTime, data2$Sub_metering_2, type = "l", ylim = c(0,40),
     cex.axis = 1, cex.lab = 1,
     col = "red", xlab = "", ylab = "")
par(new=T)
plot(data2$DateTime, data2$Sub_metering_3, type = "l", ylim = c(0,40),
     cex.axis = 1, cex.lab = 1,
     col = "blue", xlab = "", ylab = "")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2",                      
      "Sub_metering_3"), y.intersp = 1, cex = 0.9, col = c("black", "red", "blue"), 
      bty = "n", lty = c(1, 1, 1))

plot(data2$DateTime, data2$Global_reactive_power, type = "l", xlab = "datetime",
     ylab = "Global_reactive_power", cex.axis = 1, cex.lab = 1)

#dev.copy(png, file = "plot4.png")
dev.off()
