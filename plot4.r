setwd("~/Datascience")
powerdata<-read.table("household_power_consumption.txt",header=TRUE,na.strings="?",sep=";") ##read in txt file, define NAs as "?",
powerdata$Date<-as.Date(powerdata$Date,"%d/%m/%Y") ##Convert Date column to Date format
subpower<-subset(powerdata, Date == "2007-02-01" | Date =="2007-02-02") ## Subset the relevant days
subpower$datetime<-paste(subpower$Date,subpower$Time) ## Create a column where date and time are joined
subpower$datetime2<-as.POSIXct(subpower$datetime) ## Create a new column, with a new format for the joined date and time which is suitable for the plots

png(file="plot4.png")
par(mfrow = c(2, 2)) ##Define the number and arrangement of plots
plot(subpower$Global_active_power ~ subpower$datetime2, type ="l", xlab="", ylab="Global Active Power") ##plot 1
plot(subpower$Voltage ~ subpower$datetime2, type ="l", xlab="datetime", ylab="Voltage"  ) ##plot 2 with x axis label
plot(subpower$Sub_metering_1 ~ subpower$datetime2, type="l", col="black", xlab="", ylab="Energy sub metering" ) ##Plot 3 with sub_metering_1 data
points(subpower$Sub_metering_2 ~ subpower$datetime2,type="l", col="red" ) ##Adding sub_metering_2 data
points(subpower$Sub_metering_3 ~ subpower$datetime2, type="l", col="blue" ) #xAdding sub_metering_3 data
legend("topright", bty="n", lty = c(1,1,1) , col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) ##defining legend without border
plot(subpower$Global_reactive_power ~ subpower$datetime2, type ="l", xlab="datetime", ylab="Global Reactive Power")##plot 4 with x axis label
dev.off() #close device