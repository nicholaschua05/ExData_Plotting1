### RScript for Plot 2 ###

#Load txt File
File<- "./specdata/household_power_consumption.txt"
data<-read.table(File, header=TRUE, sep=";", stringsAsFactors = FALSE, dec=".")

#Subset data to fulfil dates
data.subset <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

#Creating new variable with datetime
datetime <- strptime(paste(data.subset$Date, data.subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Convert values into numeric
globalactivepower <- as.numeric(data.subset$Global_active_power)

#Creating plot2.png
png("plot2.png", width=480, height = 480)
plot(datetime, globalactivepower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()