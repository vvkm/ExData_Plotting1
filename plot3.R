#Start - Common Code for Project 1
#Download file, unzip file, and read in files.
#Download the file:
fileURL<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
destfile <- "dataset.zip"
download.file(fileURL,destfile)

# unzip the file:
unzip(destfile)

#read in file:
household <- read.table("./household_power_consumption.txt", header=TRUE, sep=";")

#type conversion from factor to date and time
household$Date<-as.Date(household$Date,"%d/%m/%Y")
#household$Time<- as.Date(household$Time, "%H:%M:%S")

#subset the data to the desired range i.e. 2-1-2007 to 2-2-2007
household200702<-subset(household,Date == "2007-02-01"| Date == "2007-02-02")

#household200702$Timestamp <- strptime(paste(household200702$Date, household200702$Time), "%d/%m/%Y %H:%M:%S")
household200702$Timestamp <-strptime(paste(household200702$Date, household200702$Time), format="%Y-%m-%d %H:%M:%S")

png(filename='plot3.png', width=480, height=480)

plot(household200702$Timestamp, household200702$Sub_metering_1, xlab="", ylab="Energy sub metering", type='l')
lines(household200702$Timestamp, household200702$Sub_metering_2, col="red")
lines(household200702$Timestamp, household200702$Sub_metering_3, col="blue")

legend("topright",col=c('black', 'red', 'blue'), legend=c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lty=1)
dev.off()
