# Datasci course 4 project 1: Plot 2
# Heikki Turakainen
#
setwd("D:\\projects\\datasci4")

# Use the extracted text file as input

filePath = "Downloads/household_power_consumption.txt"
df<-read.csv(filePath, sep=";", na.strings=c("",".","NA","?"))

# Convert Date string to Date format 

df$Date<-as.Date(df$Date, "%d/%m/%Y")

# Create a subset with only the interesting dates

df2<-df[which(df$Date==as.Date("2007/02/01", "%Y/%m/%d") | df$Date==as.Date("2007/02/02", "%Y/%m/%d")),]

# Release the memory by removing the original "huge" dataset.
rm(df)

# Create a new column combining the date and time
df2$DateTime<-strptime( paste(df2$Date, df2$Time, sep=" ") ,"%Y-%m-%d %H:%M:%S")

# Set the system locale to english to get correct weekdays to x-axis.
# NOTE: Only works with Windows!
Sys.setlocale("LC_TIME","English_United States.1252")

# Create the plot as png file

png(filename = "plot2.png", width = 480, height = 480)

plot(df2$DateTime, df2$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)") 

# Close the device!
dev.off() 


