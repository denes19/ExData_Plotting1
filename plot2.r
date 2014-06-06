
powerdata<-read.table("household_power_consumption.txt",header=TRUE,na.strings="?",sep=";") ##read in txt file, define NAs as "?",
powerdata$Date<-as.Date(powerdata$Date,"%d/%m/%Y") ##Convert Date column to Date format
subpower<-subset(powerdata, Date == "2007-02-01" | Date =="2007-02-02") ## Subset the relevant days
subpower$datetime<-paste(subpower$Date,subpower$Time) ## Create a column where date and time are joined
subpower$datetime2<-as.POSIXct(subpower$datetime) ## Create a new column, with a new format for the joined date and time which is suitable for the plots

png(file = "plot2.png")  ## Open png device; create 'plot2.png' in my working directory
## Create plot and send to a file
plot(subpower$Global_active_power ~ subpower$datetime2, type ="l", xlab="", ylab="Global Active Power (kilowatts)") ##type defines that lines will be seen not points 
dev.off()  ## Close device