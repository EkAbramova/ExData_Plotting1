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

## plot 3
plot(subData$Datetime, subData$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(subData$Datetime, subData$Sub_metering_2,  col = "red")
lines(subData$Datetime, subData$Sub_metering_3,  col = "blue")

legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## saving
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()