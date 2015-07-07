## Exploratory Data Analysis - Course Project 1
## The purpose is to examine how household energy usage varies overa 2-day period in February, 2007

## Load Household Power Consumption data
data <- read.csv("~/household_power_consumption.txt", sep=";")

## Subset data based on desired date range
data.desired <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

## Create Plot 1
GlobalActivePower <- as.numeric(data.desired$Global_active_power)
png("plot1.png", width = 480, height = 480)
hist(GlobalActivePower, col ="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts")
dev.off()
