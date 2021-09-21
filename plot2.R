# plot2
rm(list=ls())
# 
#Define file name to save and target url
zipfilename<-"Power_Dataset.zip"
zipfileurl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

#check if already downloaded and un-ziped  before, otherwise download and unzip the data
if (!file.exists(zipfilename)){
  download.file(url=zipfileurl, destfile=zipfilename)
  unzip(zipfilename) 
}
powerfile <- "household_power_consumption.txt"
# read file with data
all_data <- read.table(file=powerfile, header=TRUE, sep = ";", na.strings = "?", colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
# calculate time from date and time and add newtime column in the data
all_data$newtime <-  strptime(paste(all_data$Date, all_data$Time, sep=" "),format= "%d/%m/%Y %H:%M:%S")
# change format for date
all_data$Date=as.Date(all_data$Date, format="%d/%m/%Y")
# create final data
final_data <- subset(all_data, Date >= "2007-02-01" & Date<="2007-02-02")

#png device
png(file='plot2.png',width = 480,height = 480)
plot(final_data$newtime,final_data$Global_active_power,xlab='',ylab='Global Active Power (kilowatts)',type='l')
dev.off()