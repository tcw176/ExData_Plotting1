library(lubridate)
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data$Date <- dmy(data$Date)
data2 <- filter(data, data$Date == ymd("2007-02-01") | data$Date == ymd("2007-02-02"))
data2 <- mutate(data2, DateTime = ymd(Date) + hms(Time))
plot(data2$DateTime, data2$Global_active_power, cex.lab = 0.75, cex.axis = 0.75, 
        ylab = "Global Active Power (kilowatts)", type = "l", xlab = "")
dev.copy(png, file = "plot2.png")
dev.off()
