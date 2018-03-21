### RScript for Plot 3 ###

#Load txt File
File<- "./specdata/household_power_consumption.txt"
data<-read.table(File, header=TRUE, sep=";", stringsAsFactors = FALSE, dec=".")

#Subset data to fulfil dates
data.subset <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

#Convert values into numeric
globalactivepower <- as.numeric(data.subset$Global_active_power)
submetering1 <- as.numeric(data.subset$Sub_metering_1)
submetering2 <- as.numeric(data.subset$Sub_metering_2)
submetering3 <- as.numeric(data.subset$Sub_metering_3)
globalreactivePower <- as.numeric(data.subset$Global_reactive_power)
voltage <- as.numeric(data.subset$Voltage)

#Creating plot4.png
png("plot4.png", width=480, height = 480)

#Change graphing parameters to show 4 graphs by column
par(mfcol=c(2,2))

#First graph (Top Right)
plot(datetime, globalactivepower, type="l", xlab="", ylab="GLobal Active Power")

#Second graph (Bottom Right)
plot(datetime, submetering1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, submetering2, type="l", col="red")
lines(datetime, submetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black","red","blue"), bty="n")

#Third graph (Top Left)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

#Fourth graph (Bottom Left)
plot(datetime, globalreactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()