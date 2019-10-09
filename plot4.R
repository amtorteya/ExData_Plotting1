#Read data
db<-read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE)
#Keep only data from 2007-02-01 and 2007-02-02
dbSmall<-db[which(db$Date=="1/2/2007"|db$Date=="2/2/2007"),]
#Add feature that manages date and time in a standardized way
dbSmall$DateTime<-strptime(paste(dbSmall$Date,dbSmall$Time),format="%d/%m/%Y %T")
#Create plot
png("plot4.png",width=480,height=480,units="px")
par(mfrow=c(2,2))
#Top left
plot(dbSmall$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xaxt="n",xlab="")
axis(1,at=c(1,which(weekdays(dbSmall$DateTime)=="Friday")[1],length(gap)),labels=c("Thu","Fri","Sat"))
#Top right
plot(dbSmall$Voltage,type="l",ylab="Voltage",xlab="datetime")
#Bottom left
plot(dbSmall$Sub_metering_1,type="l",ylab="Energy sub metering",xaxt="n",xlab="")
lines(dbSmall$Sub_metering_2,col="red")
lines(dbSmall$Sub_metering_3,col="blue")
axis(1,at=c(1,which(weekdays(dbSmall$DateTime)=="Friday")[1],length(gap)),labels=c("Thu","Fri","Sat"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=1,bty="n")
#Bottom right
plot(dbSmall$Global_reactive_power,type="l",ylab="Global_reactive_power",xaxt="n",xlab="datetime")
axis(1,at=c(1,which(weekdays(dbSmall$DateTime)=="Friday")[1],length(gap)),labels=c("Thu","Fri","Sat"))
dev.off()