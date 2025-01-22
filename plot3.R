## setting the working directory and reading the complete data set
setwd("D:/csilla/data course/course materials/04_exploratory_data_analysis/01_module/project1")
pc <- read.table(file="household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

## filtering the data to have only 2 dates
library(dplyr)
pc <- filter(pc, Date == '1/2/2007' | Date == '2/2/2007'  )

pc$Date <- as.Date(pc$Date, "%d/%m/%Y")
pc$DateTime <- as.POSIXct(paste(pc$Date, pc$Time))

##plot
with(pc, plot(DateTime,Sub_metering_1, type="l", col="black", xlab="", ylab="", xaxt = "n"))
with(pc, lines(DateTime, Sub_metering_2, type="l", col="red", xlab="", ylab="", xaxt = "n"))
with(pc, lines(DateTime, Sub_metering_3, type="l", col="blue", xlab="", ylab="", xaxt = "n"))

axis.POSIXct(1,at=seq(min(pc$DateTime),max(pc$DateTime)+86400,by="day"),format="%a")
title(ylab="Energy sub metering")

legend("topright",lty = c(1,1,1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Copying my plot to a PNG file
dev.copy(png, file = "plot3.png", width = 480, height = 480, units = "px") 

## Closing the PNG device
dev.off() 
