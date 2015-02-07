# Datasci course 4 project 1: Plot 4
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
png(filename = "plot4.png", width = 480, height = 480)

# Create two by two plots
par(mfrow = c(2,2))

# PLOT 1

plot(df2$DateTime, df2$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power") 

# PLOT 2

plot(df2$DateTime, df2$Voltage,
     type="l",
     xlab="datetime",
     ylab="Global Active Power") 

# PLOT 3

# Define the value range for the y-axis 
valueRange<-range(c(df2$Sub_metering_1,df2$Sub_metering_2,df2$Sub_metering_3))

# Plot the sub_metering_1 and then add lines for 2 and 3
with(df2, plot(df2$DateTime ,df2$Sub_metering_1, 
               ylab="Energy sub metering",
               xlab="",
               type="l",
               col = "black",
               ylim=valueRange))
lines(df2$DateTime ,df2$Sub_metering_2, type="l", col = "red")
lines(df2$DateTime ,df2$Sub_metering_3, type="l", col = "blue")

# Add legend to the top right corner
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_3", "Sub_metering_3"),
       lty=c(1,1,1),
       col=c("black", "red", "blue"),
       bty="n")

# PLOT 4

plot(df2$DateTime, df2$Global_reactive_power,
     type="l",
     xlab="datetime",
     ylab="Global_reactive_power"
     ) 

# Close the device!
dev.off() 


