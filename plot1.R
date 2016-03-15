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

#type conversion from factor to date
household$Date<-as.Date(household$Date,"%d/%m/%Y")

#type conversion so that Global_active_power can be plotted into a histogram
household$Global_active_power <- as.numeric(household$Global_active_power)

#subset the data to the desired range i.e. 2-1-2007 to 2-2-2007
household200702<-subset(household,Date == "2007-02-01"| Date == "2007-02-02")
#End - Common Code for Project 1

#plot1.R unique code beginning
png(filename='plot1.png', width=480, height=480)
hist(household200702$Global_active_power,col="red", breaks=12, xlab="Global Active Power(kilowatts)", main="Global Active Power") 
dev.off()
