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

## plot 2
plot(subData$Global_active_power~subData$Datetime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

## copy to png
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()