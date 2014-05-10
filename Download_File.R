#This script is designed to download the file associated with Course Project 1 from Exploratory
#Data Analysis

if(!file.exists("household_power_consumption.zip")){
  #Identify the directory of the datafile
  fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileURL, "household_power_consumption.zip", mode="wb")
  dateDownloaded <- date()
  dateDownloaded
  
  #Unzip the data
  unzip("household_power_consumption.zip")
}
