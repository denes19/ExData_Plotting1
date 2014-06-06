powerdata<-read.table("household_power_consumption.txt",header=TRUE,na.strings="?",sep=";") ##read in txt file, define NAs as "?",
powerdata$Date<-as.Date(powerdata$Date,"%d/%m/%Y") ##Convert Date column to Date format
subpower<-subset(powerdata, Date == "2007-02-01" | Date =="2007-02-02") ## Subset the relevant days
subpower$datetime<-paste(subpower$Date,subpower$Time) ## Create a column where date and time are joined
subpower$datetime2<-as.POSIXct(subpower$datetime) ## Create a new column, with a new format for the joined date and time which is suitable for the plots


png(file = "plot1.png")  ## Open png device; create 'plot1.png' in my working directory
## Create plot and send to a file 
hist(subpower$Global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)", col=18) ##Create plot with appropriate labels and color
dev.off()  ## Close the png file device







