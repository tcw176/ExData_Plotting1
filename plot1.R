library(lubridate)
library(plyr)
library(dplyr)

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
data$Date <- dmy(data$Date)
data2 <- filter(data, data$Date == ymd("2007-02-01") | data$Date == ymd("2007-02-02"))

hist(data2$Global_active_power, col = "red", main = "",  xlab = "")

title(main = "Global Active Power", font.main = 1, cex.main = 0.85, cex.lab = 0.75,
      cex.sub = 0.75, xlab = "Global Active Power (kilowattts)")

dev.copy(png, file = "plot1.png")
dev.off()
