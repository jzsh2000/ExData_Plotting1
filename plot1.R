#!/usr/bin/env Rscript

args = commandArgs(TRUE)
stopifnot(file.exists(args[1]))

dat <- read.table(args[1],
                  sep=";",
                  header=TRUE,
                  stringsAsFactors=FALSE,
                  na.strings="?")
png('plot1.png', width=480, height=480)

hist(dat$Global_active_power,
     col = "red",
     xlab = 'Global Active Power (kilowatts)',
     main = "Global Active Power")
dev_active=dev.off()
