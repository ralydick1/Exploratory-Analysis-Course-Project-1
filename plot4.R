## Plot 4 - Plots four different plots on one image. It will plot:
## 1. linechart showing the Global Active Power usage as a function of time (plot2.R)
## 2. Linchart of Voltage as a function of time 
## 3. Linechart of Energy Sub Metering usage by meter as a function of time (plot3.R)
## 4, Linchart of Global Reactive Power as a function of time.

## Place script in same folder as the txt and run to create plot.

# 1.0 - Read Data
data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".", na.strings = "?")

# 1.1 - Subset data to period specified
subData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


# 2.0.1 - Create plot data
GAPower <- as.numeric(subData$Global_active_power)

# 2.0.2 - Acquire Datetime Data
datetime <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# 2.0.3 - Acquire Sub Metering Data
subMeter1 <- as.numeric(subData$Sub_metering_1)
subMeter2 <- as.numeric(subData$Sub_metering_2)
subMeter3 <- as.numeric(subData$Sub_metering_3)

# 2.0.4 - Acquire Voltage Data
voltage <- as.numeric(subData$Voltage)

# 2.0.4 - Acquire Global Reactive Data
GRPower <- as.numeric(subData$Global_reactive_power)


# 3.0.0 - Generate png
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

# 3.0.1 - Plot figure 1
plot(datetime, GAPower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

# 3.0.2 - Plot Figure 2
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

# 3.0.3 - Plot figure 3
plot(datetime, subMeter1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMeter2, type="l", col="red")
lines(datetime, subMeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

# 3.0.4 - Plot figure 4
plot(datetime, GRPower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()