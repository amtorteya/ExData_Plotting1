#Read data
db<-read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE)
#Keep only data from 2007-02-01 and 2007-02-02
dbSmall<-db[which(db$Date=="1/2/2007"|db$Date=="2/2/2007"),]
#Add feature that manages date and time in a standardized way
dbSmall$DateTime<-strptime(paste(dbSmall$Date,dbSmall$Time),format="%d/%m/%Y %T")
#Create plot
png("plot2.png",width=480,height=480,units="px")
plot(dbSmall$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xaxt="n",xlab="")
axis(1,at=c(1,which(weekdays(dbSmall$DateTime)=="Friday")[1],length(gap)),labels=c("Thu","Fri","Sat"))
dev.off()