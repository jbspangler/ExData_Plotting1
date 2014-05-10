#This script will generate a PNG of the third plot for Course Assignment 1 in Exploratory Data
#Analysis

library(data.table)

#Read in the Data File
Data <- fread("household_power_consumption.txt", colClasses="character")

#Combine the Date and Time into a single column
Data$Combined_Date <- paste(Data$Date, Data$Time)

#Change the dates from character to class Date
Data$Date <- as.Date(Data$Date, "%d/%m/%Y")

#Limit the Data to dates 2007-02-01 and 2007-02-02
Two_Days_of_Data <- Data[(Data$Date=="2007-02-01")|(Data$Date=="2007-02-02"), ]

#Change the class back to data.frame for easier handling of date types
Two_Days_of_Data <- as.data.frame(Two_Days_of_Data)

#Change the Power Data to numeric
Two_Days_of_Data$Global_active_power <- as.numeric(Two_Days_of_Data$Global_active_power)

#Change the combined date to class POSIXct
Two_Days_of_Data$Combined_Date <- (strptime(Two_Days_of_Data$Combined_Date, format="%d/%m/%Y %H:%M:%S"))

#Create the figure
png("plot4.png", height=480, width=480)
par(mfrow = c(2,2))

#Upper Left Plot
plot(Two_Days_of_Data$Combined_Date, Two_Days_of_Data$Global_active_power, type="l",
     ylab="Global Active Power", xlab=NA, main=NA)

#Upper Right Plot
plot(Two_Days_of_Data$Combined_Date, Two_Days_of_Data$Voltage, type="l",
     ylab="Voltage", xlab="datetime", main=NA)

#Bottom Left Plot
with(Two_Days_of_Data, plot(Combined_Date, Sub_metering_1, type="l", col="black", xlab=NA,
                            ylab="Energy sub metering"))
with(Two_Days_of_Data, lines(Combined_Date, Sub_metering_2, col ="red"))
with(Two_Days_of_Data, lines(Combined_Date, Sub_metering_3, col ="blue"))
legend("topright", lwd=0, col = c("black", "red", "blue"),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty="n")

#Bottom Right Plot
plot(Two_Days_of_Data$Combined_Date, Two_Days_of_Data$Global_reactive_power, type="l",
     ylab="Global_reactive_power", xlab="datetime", main=NA)

dev.off()
