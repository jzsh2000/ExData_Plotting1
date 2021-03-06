#!/usr/bin/env Rscript

args = commandArgs(TRUE)
stopifnot(file.exists(args[1]))
locale_bak = Sys.setlocale(category = "LC_ALL", locale = "C")
dates = strptime(c("2007-02-01","2007-02-02", "2007-02-03"), "%Y-%m-%d")

dat <- read.table(args[1],
                  sep=";",
                  header=TRUE,
                  stringsAsFactors=FALSE,
                  na.strings="?")
dat$Time = strptime(paste(dat$Date, dat$Time), '%d/%m/%Y %T')

png('plot3.png', width=480, height=480)
plot(dat$Sub_metering_1~as.numeric(dat$Time),
     type="l",
     xaxt="n",
     xlab="",
     ylab="Energy sub metering")
lines(dat$Sub_metering_2~as.numeric(dat$Time),
      col='red')
lines(dat$Sub_metering_3~as.numeric(dat$Time),
      col='blue')
axis(1,
     at = as.numeric(dates),
     labels = weekdays(dates, TRUE))
legend("topright",
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"),
       lty=1)
dev_active=dev.off()
