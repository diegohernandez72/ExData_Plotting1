setwd("~/Desktop/DST/Exploratory Data Analysis")

#Load data from archive
PowerData <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")

#Subsettingo of specific rows
FilteredData <- PowerData[PowerData$Date %in% c("1/2/2007","2/2/2007") ,]

#Change Date Column to Date Type
FilteredData[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

#Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
png("plot3.png", width=480, height=480)

## Plot 3
with(FilteredData, {
    x <- strptime(paste(FilteredData$Date, FilteredData$Time), "%Y-%m-%d %H:%M:%S")
    plot(x, FilteredData$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "")
    lines(x, FilteredData$Sub_metering_1, col = "black")
    lines(x, FilteredData$Sub_metering_2, col = "red")
    lines(x, FilteredData$Sub_metering_3, col = "blue")
    legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
   })
    
dev.off()
