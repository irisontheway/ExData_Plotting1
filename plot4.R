## 1. load the dataset

setwd("C:\\Users\\Course 4 - Exploratory Data Analysis\\CourseProject\\exdata_household_power_consumption")

dataset <- read.table(file="household_power_consumption.txt", header = TRUE, sep=";", na.strings="?")


## 2. prepare data to build graph

dataset$Date <- as.Date(dataset$Date, format="%d/%m/%Y")

projectData <- dataset[dataset$Date %in% subset(dataset$Date, dataset$Date>="2007-02-01" & dataset$Date <= "2007-02-02"),]

projectData$DateTime <- paste(projectData$Date, projectData$Time)

projectData$DateTime <- strptime(projectData$DateTime, "%Y-%m-%d %H:%M:%S")

projectData$Date <- weekdays(projectData$DateTime)


## 3. layout and print generate graphs
  # set layout
  par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

  # generate first plot
  plot(x=projectData$DateTime, y=projectData$Global_active_power, type="l", xlab="",ylab="Gloabl Active Power (kilowatts)")

  # generate second plot 
  plot(x=projectData$DateTime, y=projectData$Voltage, xlab="datetime",ylab="Voltage",type='l')

  # generate third plot
  plot(x=projectData$DateTime, y=projectData$Sub_metering_1, type="l", ylab="Energy sub metering")

  points(x=projectData$DateTime, y=projectData$Sub_metering_2, type="l", col="red")

  points(x=projectData$DateTime, y=projectData$Sub_metering_3, type="l", col="blue")

  legend("topright", col=c("black","red","blue"), lty=1, lwd=2, bty="n", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

  # generate 4th plot
  plot(x=projectData$DateTime, y=projectData$Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")


## save to plot4.png and close device

dev.copy(png, file="plot4.png", width=480, height=480)

dev.off()