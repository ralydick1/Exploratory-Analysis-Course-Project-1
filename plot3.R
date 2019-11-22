## Plot 3 - Plots a linechart showing the Energy Sub Metering usage
## by meter as a function of time over the course of 3 days.
## Place script in same folder as the txt and run to create plot.

# 1.0 - Read Data
data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".", na.strings = "?")

# 1.1 - Subset data to period specified
subData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# 2.0.1 - Create plot data
GAPower <- as.numeric(subData$Global_active_power)

# 2.0.2 - Acquire Datetime Data
datetime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#2.0.3 - Acquire Sub Metering Data
subMeter1 <- as.numeric(subData$Sub_metering_1)
subMeter2 <- as.numeric(subData$Sub_metering_2)
subMeter3 <- as.numeric(subData$Sub_metering_3)

# 3.0 - Generate png
png("plot3.png", width=480, height=480)
plot(datetime, subMeter1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMeter2, type="l", col="red")
lines(datetime, subMeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()