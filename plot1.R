## 1. load the dataset

setwd("C:\\Users\\Course 4 - Exploratory Data Analysis\\CourseProject\\exdata_household_power_consumption")

dataset <- read.table(file="household_power_consumption.txt", header = TRUE, sep=";", na.strings="?")


## 2. Convert date format

dataset$Date <- as.Date(dataset$Date, format="%d/%m/%Y")

## 3. extract the needed dates which are between 2007-02-01 and 2007-02-02

projectData <- dataset[dataset$Date %in% subset(dataset$Date, dataset$Date>="2007-02-01" & dataset$Date <= "2007-02-02"),]


## 4. create graph, save to plot1.png and close device

library(datasets)

hist(projectData$Global_active_power, col="red", main="Global Active Power", xlab="Gloabl Active Power (kilowatts)")

dev.copy(png, file='plot1.png', width=480, height=480)

dev.off()

