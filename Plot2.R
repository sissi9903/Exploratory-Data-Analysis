
png( file = "plot2.png")

z <- read.csv("Power.txt", sep = ";", stringsAsFactors = FALSE, na.strings = "?")
z <- within(z, { DateTime <- strptime(paste(z$Date, z$Time, sep=" "), "%d/%m/%Y %H:%M:%S")})
z$Date <- as.Date(z$Date, "%d/%m/%Y")
a <- as.Date("31/01/2007", "%d/%m/%Y")
b <- as.Date("03/02/2007", "%d/%m/%Y")
Power <- subset(z, Date > a & Date < b)

par(mar = c(5,6,4,4))
plot(Power$DateTime, Power$Global_active_power, type = "l", xlab = " ", ylab = "Global Active Power (kilowatts)")

dev.off()


