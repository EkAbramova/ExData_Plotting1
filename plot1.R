## loading data
allData <- read.table("./data/household_power_consumption.txt", sep = ";", stringsAsFactors = F, header=TRUE,  na.strings="?")

## converting data
allData$Date <- as.Date(allData$Date, format="%d/%m/%Y")

## subseting
subData <- subset(allData, allData$Date >= "2007-02-01" & allData$Date <="2007-02-02")
rm(allData)

## plot 1
hist(subData$Global_active_power, col="Red", main = "Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")

## copy to png
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()