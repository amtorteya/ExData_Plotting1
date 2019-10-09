#Read data
db<-read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE)
#Keep only data from 2007-02-01 and 2007-02-02
dbSmall<-db[which(db$Date=="1/2/2007"|db$Date=="2/2/2007"),]
#Create plot
png("plot1.png",width=480,height=480,units="px")
hist(as.numeric(dbSmall$Global_active_power),col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power")
dev.off()