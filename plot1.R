
install.packages("png")
library(png)

#download data

fileURL <-"http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileURL,"Project/ProjectData.zip")

#Unzip the file
if(!(file.exists("./Project/household_power_consumption.txt"))) 
  unzip("./Project/ProjectData.zip")

EPCData <- read.table("./Project/household_power_consumption.txt",header = TRUE,sep=";",dec=".")
str(EPCData)

EPCFebData <- EPCData[EPCData$Date %in% c("1/2/2007","2/2/2007"),]

globalActivePower <- as.numeric(as.character(EPCFebData$Global_active_power))

png("./Project/plot1.png")
hist(globalActivePower, col = "red",main = "Global Active Power",xlab = "Global Active Power (kilowatts)")

dev.off()