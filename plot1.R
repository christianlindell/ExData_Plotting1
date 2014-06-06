# To use this script it has to be placed in the same catalog as the file 
# "household_power_consumption.txt" that can be downloaded from 
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip


dataenergy <- read.csv2("household_power_consumption.txt", header=TRUE, na.strings="?",stringsAsFactors=F)
dataenergy <- dataenergy[dataenergy$Date =="1/2/2007" | dataenergy$Date =="2/2/2007" ,]
dataenergy$datetime <- strptime(x=paste(dataenergy$Date, dataenergy$Time),"%d/%m/%Y %H:%M:%S")
dataenergy$Global_active_power <- as.numeric(dataenergy$Global_active_power)
dataenergy$Global_reactive_power <- as.numeric(dataenergy$Global_reactive_power)
dataenergy$Voltage <- as.numeric(dataenergy$Voltage)
dataenergy$Global_intensity <- as.numeric(dataenergy$Global_intensity)
dataenergy$Sub_metering_1 <- as.numeric(dataenergy$Sub_metering_1)
dataenergy$Sub_metering_2 <- as.numeric(dataenergy$Sub_metering_2)
dataenergy$Sub_metering_3 <- as.numeric(dataenergy$Sub_metering_3)



# Plot 1
png(file = "plot1.png", width=480,height=480, bg = "transparent")
par(bg = "transparent")
hist(dataenergy$Global_active_power, breaks=12, 
     col="red", 
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)", 
     ylab="Frequency")
dev.off()
