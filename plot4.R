setwd("~/Desktop/DST/Exploratory Data Analysis")

#Load data from archive
PowerData <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")

#Subsettingo of specific rows
FilteredData <- PowerData[PowerData$Date %in% c("1/2/2007","2/2/2007") ,]

#Change Date Column to Date Type
FilteredData[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]
x <- strptime(paste(FilteredData$Date, FilteredData$Time), "%Y-%m-%d %H:%M:%S")

#Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
png("plot4.png", width=480, height=480)

#Setting 2 graphs in a row, 2 columns
par(mfrow=c(2,2))

#setting de margins (The default for the inner margin is c(5.1, 4.1, 4.1, 2.1) 
par(mfrow = c(2, 3), mar = c(4, 4, 2, 1), oma = c(0, 0, 2, 0))
#plot first graph
plot(x, FilteredData$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
#plot second graph
plot(FilteredData$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
#plot third graph
with(FilteredData, {
    x <- strptime(paste(FilteredData$Date, FilteredData$Time), "%Y-%m-%d %H:%M:%S")
    plot(x, FilteredData$Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = "")
    lines(x, FilteredData$Sub_metering_1, col = "black")
    lines(x, FilteredData$Sub_metering_2, col = "red")
    lines(x, FilteredData$Sub_metering_3, col = "blue")
    legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})
#plot fourth graph
plot(x, FilteredData$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")





dev.off()

