library(lubridate)
library(plyr)
library(dplyr)

fileName <- "household_power_consumption.txt"
dat <- read.table(fileName,header=TRUE,na.strings="?",sep=";")
dat$Date <- dmy(dat$Date)
dat_sub <- dat[dat$Date >= ymd(20070201),]
dat_sub <- dat_sub[dat_sub$Date <= ymd(20070202),]

dat_sub$date_time <- strptime(paste(dat_sub$Date,dat_sub$Time), "%Y-%m-%d %H:%M:%S")

png("plot2.png", width=480, height=480)
plot(dat_sub$date_time,dat_sub$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts")
dev.off()