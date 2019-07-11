## Acknowledgement: I prepared for this exercise by studying a dozen published
##   solutions.  Also, the ordinate legends "Energy sub metering" in plots 3 and 4
##   are merely a repetition of the plot title without substance. I corrected
##   these legends to "Active Energy [Watt-hr]".
##
dataFile <- "./data/household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
globalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power [kW]")
dev.off()
