#read data and create plot
rm(list=ls())
library(dplyr)
library(data.table)
library(lubridate)

DT <- fread("household_power_consumption.txt", header = TRUE,sep = ";",na.strings="?",nrows=100000) %>% 
  mutate(Date=dmy(Date),dateTime=ymd_hms(paste(Date,Time)))%>%filter(Date >= "2007-02-01" & Date <="2007-02-02")

plot(DT$Global_active_power~DT$dateTime,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.copy(png,"plot2.png")
dev.off()
