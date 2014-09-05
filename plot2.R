###############################################################################
#This set of codes Read the Electrical Power Consumption, selects the data within 
#time period 2007-02-01 - 2007-02-02, converts the data variables appropriately
#and make some plots.
#Olusoji O. D.
###############################################################################
rm(list=ls())
con1 <- file("C:/Users/USER/Documents/Coursera/data/household_power_consumption.txt",open="r")
#
con2 <- file("C:/Users/USER/Documents/Coursera/data/household_power_consumption_names.txt",open="r")
#
ass_data <- read.table(con1,skip=23437,nrows=46080,sep=";",colClasses="character")
#
ass_data_names <- read.table(con2,nrows=1)
#Close the Opened Connections
close(con1)
close(con2)
#
ass_data_names2 <- sapply(ass_data_names,as.vector)
names(ass_data) <- ass_data_names2
#
ass_data$Time <- paste(ass_data$Date,ass_data$Time)
#
ass_data$Time <- strptime(ass_data$Time,format="%d/%m/%Y %H:%M:%S",tz="")
#
ass_data$Date <- as.Date(ass_data$Date,format="%d/%m/%Y")
#
setwd("C:/Users/USER/ExData_Plotting1")
#
png(height=480,width=480,file="plot2.png")
#
plot(ass_data$Time,ass_data$Global_active_power,type="l",xlab="",ylab="Global Active Power (Kilowatts)")
#
dev.off()



