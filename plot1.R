setwd("~/Desktop/DST/Exploratory Data Analysis")

#Load data from archives
PowerData <- data.table::fread(input = "household_power_consumption.txt", na.strings="?")
lib
#Subsettingo of specific rows
FilteredData <- PowerData[PowerData$Date %in% c("1/2/2007","2/2/2007") ,]

#Change Date Column to Date Type
FilteredData[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

#Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
png("plot1.png", width=480, height=480)

## Plot 1
hist(PowerData[, Global_active_power], main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red") 

dev.off()



