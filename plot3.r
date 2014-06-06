powerdata<-read.table("household_power_consumption.txt",header=TRUE,na.strings="?",sep=";") ##read in txt file, define NAs as "?",
powerdata$Date<-as.Date(powerdata$Date,"%d/%m/%Y") ##Convert Date column to Date format
subpower<-subset(powerdata, Date == "2007-02-01" | Date =="2007-02-02") ## Subset the relevant days
subpower$datetime<-paste(subpower$Date,subpower$Time) ## Create a column where date and time are joined
subpower$datetime2<-as.POSIXct(subpower$datetime) ## Create a new column, with a new format for the joined date and time which is suitable for the plots

png(file="plot3.png")
plot(subpower$Sub_metering_1 ~ subpower$datetime2, type="l", col="black", xlab="", ylab="Energy sub metering" ) ##Create plot with sub_metering_1 data only
points(subpower$Sub_metering_2 ~ subpower$datetime2,type="l", col="red" ) ## Add sub_metering_2 data as well to the plot in red
points(subpower$Sub_metering_3 ~ subpower$datetime2, type="l", col="blue" ) ## Add sub_metering_3 data as well to the plot in red
legend("topright", lty=c(1,1,1), col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) ##Add legend
dev.off() ##Close device