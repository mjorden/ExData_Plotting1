library(lubridate)
library(plyr)
library(dplyr)

fileName <- "household_power_consumption.txt"
dat <- read.table(fileName,header=TRUE,na.strings="?",sep=";")
dat$Date <- dmy(dat$Date)
dat_sub <- dat[dat$Date >= ymd(20070201),]
dat_sub <- dat_sub[dat_sub$Date <= ymd(20070202),]

png("plot1.png", width=480, height=480)
hist(dat_sub$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency",main = "Global Active Power")
dev.off()