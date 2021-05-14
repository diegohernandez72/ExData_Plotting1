setwd("~/Desktop/DST/Exploratory Data Analysis")

#Load data from archives
PowerData <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")

#Subsettingo of specific rows
FilteredData <- PowerData[PowerData$Date %in% c("1/2/2007","2/2/2007") ,]

#Change Date Column to Date Type
FilteredData[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

# Making a POSIXct date capable of being graphed by time of day
x <- strptime(paste(FilteredData$Date, FilteredData$Time), "%Y-%m-%d %H:%M:%S")

#Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
png("plot2.png", width=480, height=480)

## Plot 2
plot(x, FilteredData$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

dev.off()

