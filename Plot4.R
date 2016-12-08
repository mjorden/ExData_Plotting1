library(lubridate)
library(plyr)
library(dplyr)

fileName <- "household_power_consumption.txt"
dat <- read.table(fileName,header=TRUE,na.strings="?",sep=";")
dat$Date <- dmy(dat$Date)
dat_sub <- dat[dat$Date >= ymd(20070201),]
dat_sub <- dat_sub[dat_sub$Date <= ymd(20070202),]

dat_sub$date_time <- strptime(paste(dat_sub$Date,dat_sub$Time), "%Y-%m-%d %H:%M:%S")

png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))

plot(dat_sub$date_time, dat_sub$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts")

plot(dat_sub$date_time, dat_sub$Voltage, type="l", ylab="Voltage", xlab="datetime")

plot(dat_sub$date_time,dat_sub$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(dat_sub$date_time,dat_sub$Sub_metering_2,type="l",col="red")
lines(dat_sub$date_time,dat_sub$Sub_metering_3,type="l",col="blue")
legend("topright", legend = c("Sub Metering 1","Sub Metering 2","Sub Metering 3"), col = c("black","blue","red"),lty=1)

plot(dat_sub$date_time,dat_sub$Global_reactive_power, type="l", ylab = "Global_reactive_power", xlab="datetime")

dev.off()