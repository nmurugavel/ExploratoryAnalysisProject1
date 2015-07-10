## Read data of 2007-02-01 and 2007-02-02
allData <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
plotData <- subset(allData, Date == "1/2/2007" | Date == "2/2/2007", select = Date:Sub_metering_3)
rm(allData)

## Plot the histogram
hist(plotData$Global_active_power, xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power", col = "red")

## Save as png file
## Default height and width are 480 pixels; so do not have to set explicitly
dev.copy(png, file = "plot1.png")
dev.off()
