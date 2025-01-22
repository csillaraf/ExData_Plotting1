## setting the working directory and reading the complete data set
setwd("D:/csilla/data course/course materials/04_exploratory_data_analysis/01_module/project1")
pc <- read.table(file="household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

## filtering the data to have only 2 dates
library(dplyr)
pc <- filter(pc, Date == '1/2/2007' | Date == '2/2/2007'  )

pc$Date <- as.Date(pc$Date, "%d/%m/%Y")
pc$DateTime <- as.POSIXct(paste(pc$Date, pc$Time))


plot(pc$DateTime, pc$Global_active_power , 
              type="l", 
              ylab="Global Active Power (kilowatts)",
              xlab="",
              xaxt = "n",
)

axis.POSIXct(1,at=seq(min(pc$DateTime),max(pc$DateTime)+86400,by="day"),format="%a")

## Copying my plot to a PNG file
dev.copy(png, file = "plot2.png", width = 480, height = 480, units = "px") 

## Closing the PNG device
dev.off() 
