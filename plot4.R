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

png('plot4.png', width=480, height=480)
par_bak = par(mfrow = c(2,2))
# plot-1
plot(dat$Global_active_power~as.numeric(dat$Time),
     type = "l",
     xaxt = "n",
     ylab = "Global Active Power",
     xlab = "")
axis(1,
     at = as.numeric(dates),
     labels = weekdays(dates, TRUE))
# plot-2
plot(dat$Voltage~as.numeric(dat$Time),
     type = "l",
     xaxt = "n",
     ylab = "Voltage",
     xlab = "datetime")
axis(1,
     at = as.numeric(dates),
     labels = weekdays(dates, TRUE))
# plot-3
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
       bty='n',
       lty=1)
# plot-4
plot(dat$Global_reactive_power~as.numeric(dat$Time),
     type="l",
     xaxt="n",
     xlab="datetime",
     ylab="Global_reactive_power")
axis(1,
     at = as.numeric(dates),
     labels = weekdays(dates, TRUE))

par(par_bak)
dev_active=dev.off()
