png( file = "plot3.png")

z <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, na.strings = "?")
z <- within(z, { DateTime <- strptime(paste(z$Date, z$Time, sep=" "), "%d/%m/%Y %H:%M:%S")})
z$Date <- as.Date(z$Date, "%d/%m/%Y")
a <- as.Date("31/01/2007", "%d/%m/%Y")
b <- as.Date("03/02/2007", "%d/%m/%Y")
Power <- subset(z, Date > a & Date < b)

par(mar = c(5,6,4,4))
plot(Power$DateTime, Power$Sub_metering_1, type = "l", , col = "black", xlab = " ", ylab = "Energy sub metering")
lines(Power$DateTime, Power$Sub_metering_2, col = "red")
lines(Power$DateTime, Power$Sub_metering_3, col = "blue")
legend("topright", lty = 1, lwd = 2, col = c("black", "red", "blue"), legend = c("Sub-metering_1", "Sub-metering_2", "Sub-metering_3"))

dev.off()



