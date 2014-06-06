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

# Plot 4

png(file = "plot4.png", width=480,height=480, bg = "transparent")
par(mfrow = c(2, 2))
par(bg = "transparent")
with(dataenergy, {
  plot(datetime, Global_active_power, type="n", ylab="Global Active Power", xlab=" ")
  lines(datetime, Global_active_power) 
  
  plot(datetime, Voltage, type="n",ylab="Voltage")
  lines(datetime, Voltage) 
  
  plot(datetime, Sub_metering_1, type="n", ylab="Energy sub metering", xlab=" ")
  lines(datetime, Sub_metering_1, col="black")
  lines(datetime, Sub_metering_2, col="red") 
  lines(datetime, Sub_metering_3, col="blue")
  legend("topright", lty = 1, col = c("black", "red", "blue"), 
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty="n")
  
  plot(datetime, Global_reactive_power, type="n", ylab="Global_reactive_power")
  lines(datetime, Global_reactive_power)
})
dev.off()
