# Datasci course 4 project 1: Plot 1
# Heikki Turakainen

setwd("D:\\projects\\datasci4")

# Download the zip file if not done yet, and extract to current dir.

zipFilePath <- "Downloads/sc4_project1_data.zip"
if (!file.exists(zipFilePath)) {
  fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
  download.file(fileUrl, destfile = zipFilePath)
  dateDownloaded <- date()
  
  unzip(zipFilePath)
}

# Use the extracted text file as input
filePath = "household_power_consumption.txt"

df<-read.csv(filePath, sep=";", na.strings=c("",".","NA","?"))

# Convert Date string to Date format 

df$Date<-as.Date(df$Date, "%d/%m/%Y")

# Create a subset with only the interesting dates

df2<-df[which(df$Date==as.Date("2007/02/01", "%Y/%m/%d") | df$Date==as.Date("2007/02/02", "%Y/%m/%d")),]

# Release the memory by removing the original "huge" dataset.
rm(df)

# Create the plot as png file

png(filename = "plot1.png", width = 480, height = 480)

hist(df2$Global_active_power,
     main="Global Active Power", 
     col="red", 
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency") 

# Close the device!
dev.off() 


