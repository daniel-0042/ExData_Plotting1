#read data and create plot
rm(list=ls())
library(dplyr)
library(data.table)
library(lubridate)

DT <- fread("household_power_consumption.txt", header = TRUE,sep = ";",na.strings="?",nrows=100000) %>% 
  mutate(Date=dmy(Date),dateTime=ymd_hms(paste(Date,Time)))%>%filter(Date >= "2007-02-01" & Date <="2007-02-02")


hist(DT$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.copy(png,"plot1.png")
dev.off()
