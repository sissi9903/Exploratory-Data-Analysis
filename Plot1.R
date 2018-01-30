png( file = "plot1.png")

z <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE, na.strings = "?")
z$Date <- as.Date(z$Date, "%d/%m/%Y")
a <- as.Date("31/01/2007", "%d/%m/%Y")
b <- as.Date("03/02/2007", "%d/%m/%Y")
Power <- subset(z, Date > a & Date < b)

par(mar = c(5,6,4,4))
hist(Power$Global_active_power, col = "red", breaks = 16, xlab = "Gloabl Active Power (kilowatts)", main = "Global Active Power")

dev.off()

