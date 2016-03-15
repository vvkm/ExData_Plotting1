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

#type conversion so that Global_active_power can be plotted into a histogram
household200702$Global_active_power <- as.numeric(household200702$Global_active_power)

#End - Common Code for Project 1

#plot2.R unique code beginning
png(filename='plot2.png', width=480, height=480)
plot(household200702$Timestamp, household200702$Global_active_power, xlab="", ylab="Global Active Power(kilowatts)", type='l')
dev.off()
#plot2.R unique code end