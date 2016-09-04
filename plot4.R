## loading data
allData <- read.table("./data/household_power_consumption.txt", sep = ";", stringsAsFactors = F, header=TRUE,  na.strings="?")

## converting data
allData$Date <- as.Date(allData$Date, format="%d/%m/%Y")

## subseting
subData <- subset(allData, allData$Date >= "2007-02-01" & allData$Date <="2007-02-02")
rm(allData)

## time
date_time <- paste(as.Date(subData$Date), subData$Time)
subData$Datetime <- as.POSIXct(date_time)

## ploting all
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

## plot 1
plot(subData$Datetime, subData$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")

## plot 2
plot(subData$Datetime, subData$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

## plot3
plot(subData$Datetime, subData$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", col = "black")
lines(subData$Datetime, subData$Sub_metering_2, xlab = "", ylab = "Sub_metering_2", col = "red")
lines(subData$Datetime, subData$Sub_metering_3, xlab = "", ylab = "Sub_metering_3", col = "blue")
legend("topright", bty = "n", y.intersp = 0.5 , lty=1 , col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.7)

## plot4
plot(subData$Datetime, subData$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
