## Read data of 2007-02-01 and 2007-02-02
allData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
plotData <- subset(allData, Date == "1/2/2007" | Date == "2/2/2007", select = Date:Sub_metering_3)
rm(allData)

## Data type conversions
Date_time <- strptime(paste(plotData$Date, plotData$Time, sep = " "), format = "%d/%m/%Y %H:%M:%S")
plotData <- cbind(plotData, Date_time)

## Plot the graph
plot(plotData$Date_time, plotData$Sub_metering_1, col = "black", xlab = "", ylab = "Energy sub metering", type = "l")
lines(plotData$Date_time, plotData$Sub_metering_2, col = "red")
lines(plotData$Date_time, plotData$Sub_metering_3, col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Save as png file
## Default height and width are 480 pixels; so do not have to set explicitly
dev.copy(png, file = "plot3.png")
dev.off()
