#This script will generate a PNG of the first plot for Course Assignment 1 in Exploratory Data
#Analysis

library(data.table)

#Read in the Data File
Data <- fread("household_power_consumption.txt", colClasses="character")

#Change the dates from character to class Date
Data$Date <- as.Date(Data$Date, "%d/%m/%Y")

#Limit the Data to dates 2007-02-01 and 2007-02-02
Two_Days_of_Data <- Data[(Data$Date=="2007-02-01")|(Data$Date=="2007-02-02"), ]

#Change the Power Data to numeric
Two_Days_of_Data$Global_active_power <- as.numeric(Two_Days_of_Data$Global_active_power)

#Create the figure
png("plot1.png", height=480, width=480)
hist(Two_Days_of_Data$Global_active_power, col="red", xlab="Global Active Power (kilowatts)",
     ylab="Frequency", main="Global Active Power")
dev.off()
