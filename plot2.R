## 1. load the dataset

setwd("C:\\Users\\Course 4 - Exploratory Data Analysis\\CourseProject\\exdata_household_power_consumption")

dataset <- read.table(file="household_power_consumption.txt", header = TRUE, sep=";", na.strings="?")


## 2. prepare data to build graph

dataset$Date <- as.Date(dataset$Date, format="%d/%m/%Y")

projectData <- dataset[dataset$Date %in% subset(dataset$Date, dataset$Date>="2007-02-01" & dataset$Date <= "2007-02-02"),]

projectData$DateTime <- paste(projectData$Date, projectData$Time)

projectData$DateTime <- strptime(projectData$DateTime, "%Y-%m-%d %H:%M:%S")

projectData$Date <- weekdays(projectData$DateTime)

## 3. create graph, save to plot2.png and close device

plot(x=projectData$DateTime, y=projectData$Global_active_power, type="l", xlab="",ylab="Gloabl Active Power (kilowatts)")

dev.copy(png, file="plot2.png", width=480, height=480)

dev.off()

