## setting the working directory and reading the complete data set
setwd("D:/csilla/data course/course materials/04_exploratory_data_analysis/01_module/project1")
pc <- read.table(file="household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

## filtering the data to have only 2 dates
library(dplyr)
pc <- filter(pc, Date == '1/2/2007' | Date == '2/2/2007'  )

## creating and formatting a new variable called DateTime as a combination of Date and Time 
pc <- mutate(pc, DateTime = paste(as.Date(Date,format="%d/%m/%Y"), Time))
pc <- mutate(pc,DateTime = strptime(DateTime, "%Y-%m-%d %H:%M:%S"))

## PLOT 1
with(pc, hist(Global_active_power, col="red", xlab="Global Active Power (kilowatts)",main="Global Active Power"))

## Copying my plot to a PNG file
dev.copy(png, file = "plot1.png", width = 480, height = 480, units = "px") 

## Closing the PNG device
dev.off()                               
