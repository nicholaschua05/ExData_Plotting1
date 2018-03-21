### RScript for Plot 1 ###

#Load txt File
File<- "./specdata/household_power_consumption.txt"
data<-read.table(File, header=TRUE, sep=";", stringsAsFactors = FALSE, dec=".")

#Subset data to fulfil dates
data.subset <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

#Convert values into numeric
globalactivepower <- as.numeric(data.subset$Global_active_power)

#Creating plot1.png
png("plot1.png", width=480, height = 480)
hist(globalactivepower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts")
dev.off()
