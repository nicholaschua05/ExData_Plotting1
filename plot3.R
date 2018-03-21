### RScript for Plot 3 ###

#Load txt File
File<- "./specdata/household_power_consumption.txt"
data<-read.table(File, header=TRUE, sep=";", stringsAsFactors = FALSE, dec=".")

#Subset data to fulfil dates
data.subset <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

#Creating new variable with datetime
datetime <- strptime(paste(data.subset$Date, data.subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Convert values into numeric
submetering1 <- as.numeric(data.subset$Sub_metering_1)
submetering2 <- as.numeric(data.subset$Sub_metering_2)
submetering3 <- as.numeric(data.subset$Sub_metering_3)

#Creating plot3.png
png("plot3.png", width=480, height = 480)
plot(datetime, submetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, submetering2, type="l", col="red")
lines(datetime, submetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black","red","blue"))
dev.off()
