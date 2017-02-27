## 1. load the dataset

setwd("C:\\Users\\Course 4 - Exploratory Data Analysis\\CourseProject\\exdata_household_power_consumption")

dataset <- read.table(file="household_power_consumption.txt", header = TRUE, sep=";", na.strings="?")


## 2. prepare data to build graph

dataset$Date <- as.Date(dataset$Date, format="%d/%m/%Y")

projectData <- dataset[dataset$Date %in% subset(dataset$Date, dataset$Date>="2007-02-01" & dataset$Date <= "2007-02-02"),]

projectData$DateTime <- paste(projectData$Date, projectData$Time)

projectData$DateTime <- strptime(projectData$DateTime, "%Y-%m-%d %H:%M:%S")

projectData$Date <- weekdays(projectData$DateTime)


## 3. create graph, save to plot3.png and close device

plot(x=projectData$DateTime, y=projectData$Sub_metering_1, type="l", ylab="Energy sub metering")

points(x=projectData$DateTime, y=projectData$Sub_metering_2, type="l", col="red")

points(x=projectData$DateTime, y=projectData$Sub_metering_3, type="l", col="blue")

legend("topright", col=c("black","red","blue"), lwd=c(1,1,1), c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.copy(png, file="plot3.png", width=480, height=480)

dev.off()