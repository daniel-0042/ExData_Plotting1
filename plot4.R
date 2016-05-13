#read data and create plot
rm(list=ls())
library(dplyr)
library(data.table)
library(lubridate)

DT <- fread("household_power_consumption.txt", header = TRUE,sep = ";",na.strings="?",nrows=100000) %>% 
  mutate(Date=dmy(Date),dateTime=ymd_hms(paste(Date,Time)))%>%filter(Date >= "2007-02-01" & Date <="2007-02-02")

par(mfrow=c(2,2))
#plot left top
plot(DT$Global_active_power~DT$dateTime,type="l",ylab="Global Active Power (kilowatts)",xlab="")
#plot right
plot(DT$Voltage~DT$dateTime,type="l",ylab="Voltage",xlab="datetime")
#plot left bottom
plot(DT$Sub_metering_1~DT$dateTime,type="n",ylab="Energy sub metering",xlab="")
points(DT$Sub_metering_1~DT$dateTime,type="l",col="black")
points(DT$Sub_metering_2~DT$dateTime,type="l",col="red")
points(DT$Sub_metering_3~DT$dateTime,type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1))
#plot right top
plot(DT$Global_reactive_power~DT$dateTime,type="l",ylab="Global_reactive_power",xlab="datetime")

dev.copy(png,"plot4.png")
dev.off()
