library(lubridate)

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data$Date <- dmy(data$Date)
data2 <- filter(data, data$Date == ymd("2007-02-01") | data$Date == ymd("2007-02-02"))
data2 <- mutate(data2, DateTime = ymd(Date) + hms(Time))

par(mfrow = c(2,2))

plot(data2$DateTime, data2$Global_active_power, cex.lab = 0.7, cex.axis = 0.7, ylab = "Global Active Power", type = "l", xlab = "")

plot(data2$DateTime, data2$Voltage, type = "l", xlab = "datetime", ylab = "Voltage", 
     cex.axis = 0.75, cex.lab = 0.75)


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

legend("topright", legend = c("Sub_metering_1  ", "Sub_metering_2  ",                      
      "Sub_metering_3  "), cex = 0.7, col = c("black", "red", "blue"), 
      bty = "n", lty = c(1, 1, 1))

plot(data2$DateTime, data2$Global_reactive_power, type = "l", xlab = "datetime",
     ylab = "Global_reactive_power", cex.axis = 0.6, cex.lab = 0.75)

dev.copy(png, file = "plot4.png")
dev.off()
