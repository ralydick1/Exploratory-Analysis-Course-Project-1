## Plot 2 - Plots a linechart showing the Global Active Power usage as
## a function of time over the course of 3 days.
## Place script in same folder as the txt and run to create plot.

# 1.0 - Read Data
data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".", na.strings = "?")

# 1.1 - Subset data to period specified
subData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# 2.0.1 - Create plot data
GAPower <- as.numeric(subData$Global_active_power)

# 2.0.2 - Acquire Datetime Data
datetime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# 3.0 - Generate png
png("plot2.png", width=480, height=480)
plot(datetime, GAPower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()