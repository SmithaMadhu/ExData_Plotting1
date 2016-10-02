
#download data

fileURL <-"http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL,"Project/ProjectData.zip")

#Unzip the file
if(!(file.exists("./Project/household_power_consumption.txt"))) 
  unzip("./Project/ProjectData.zip")

EPCData <- read.table("./Project/household_power_consumption.txt",header = TRUE,sep=";",dec=".")
str(EPCData)

EPCFebData <- EPCData[EPCData$Date %in% c("1/2/2007","2/2/2007"),]

subMetering1 <- as.numeric(as.character(EPCFebData$Sub_metering_1))
subMetering2 <- as.numeric(as.character(EPCFebData$Sub_metering_2))
subMetering3 <- as.numeric(as.character(EPCFebData$Sub_metering_3))
datetime <- strptime(paste(EPCFebData$Date,EPCFebData$Time," "),"%d/%m/%Y %H:%M:%S")


png("./Project/plot3.png") 

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="") 
lines(datetime, subMetering2, type="l", col="red") 
lines(datetime, subMetering3, type="l", col="blue") 
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue")) 

dev.off() 


