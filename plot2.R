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

png('plot2.png', width=480, height=480)
plot(dat$Global_active_power~as.numeric(dat$Time),
     type = "l",
     xaxt = "n",
     ylab = "Global Active Power (kilowatts)",
     xlab = "")
axis(1,
     at = as.numeric(dates),
     labels = weekdays(dates, TRUE))
dev_active=dev.off()
