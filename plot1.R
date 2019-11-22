## Plot 1 - Plots a histogram showing the Frequecy 
## of Global Activae Power Usage measured in Kilowats
## Place script in same folder as the txt and run to create plot.

# 1.0 - Read Data
data <- read.table("./household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".", na.strings = "?")

# 1.1 - Subset data to period specified
subData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# 2.0 - Create plot data
GAPower <- as.numeric(subData$Global_active_power)

# 3.0 - Generate png
png("plot1.png", width=480, height=480)
hist(GAPower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()