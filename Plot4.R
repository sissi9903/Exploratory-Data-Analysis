
png( file = "plot4.png")

z <- read.csv("Power.txt", sep = ";", stringsAsFactors = FALSE, na.strings = "?")
z <- within(z, { datetime <- strptime(paste(z$Date, z$Time, sep=" "), "%d/%m/%Y %H:%M:%S")})
z$Date <- as.Date(z$Date, "%d/%m/%Y")
a <- as.Date("31/01/2007", "%d/%m/%Y")
b <- as.Date("03/02/2007", "%d/%m/%Y")
Power <- subset(z, Date > a & Date < b)

par(mfrow = c(2,2), mar =c(5,5,3,3))
#Plot 1
plot(Power$datetime, Power$Global_active_power, type = "l", xlab = " ", ylab = "Global Active power (kilowatts)")
#Plot 2
plot(Power$datetime, Power$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
#Plot 3
plot(Power$datetime, Power$Sub_metering_1, type = "l", , col = "black", xlab = " ", ylab = "Energy sub metering")
lines(Power$datetime, Power$Sub_metering_2, col = "red")
lines(Power$datetime, Power$Sub_metering_3, col = "blue")
legend("topright", lty = 1, lwd = 2, col = c("black", "red", "blue"), legend = c("Sub-metering_1", "Sub-metering_2", "Sub-metering_3"), bty = "n")
#Plot 4
plot(Power$datetime, Power$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()