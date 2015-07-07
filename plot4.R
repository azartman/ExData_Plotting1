## Exploratory Data Analysis - Course Project 1
## The purpose is to examine how household energy usage varies overa 2-day period in February, 2007

## Load Household Power Consumption data
data <- read.csv("~/household_power_consumption.txt", sep=";")

## Subset data based on desired date range
data.desired <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

## Create Plot 4 Series
datetime <- strptime(paste(data.desired$Date, data.desired$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GlobalActivePower <- as.numeric(data.desired$Global_active_power)
subMetering1 <- as.numeric(data.desired$Sub_metering_1)
subMetering2 <- as.numeric(data.desired$Sub_metering_2)
subMetering3 <- as.numeric(data.desired$Sub_metering_3)
GlobalReactivePower <- as.numeric(data.desired$Global_reactive_power)
voltage <- as.numeric(data.desired$Voltage)

png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

##1St Plot
plot(datetime, GlobalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

##2nd Plot
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

##3rd Plot
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

#4th Plot
plot(datetime, GlobalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()