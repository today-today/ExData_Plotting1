######plot3
####read in data
temp<-tempfile()
url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,temp,method="curl")
data<-read.table(unz(temp,"household_power_consumption.txt"),header=TRUE,sep=";")
unlink(temp)

######plot

data3<-subset(data,Date == "1/2/2007"|Date == "2/2/2007")
data3$Global_active_power<-as.numeric(data3$Global_active_power)
data3$date<-strptime(paste(data3$Date, data3$Time), "%d/%m/%Y %H:%M:%S")
data3$Sub_metering_1<-as.numeric(data3$Sub_metering_1)
data3$Sub_metering_2<-as.numeric(data3$Sub_metering_2)
data3$Sub_metering_3<-as.numeric(data3$Sub_metering_3)

png(filename="plot4.png")
###plot1
par(mfrow=c(2,2))
plot(data3$date,data3$Global_active_power,
     type="l",ylab="Global Active Power(kilowatts)",xlab="Weekday")

###plot2
plot(data3$date,data3$Voltage,xlab="datetime",ylab="Voltage",type="l")

####plot3
yrange<-range(data3$Sub_metering_1,data3$Sub_metering_2,data3$Sub_metering_3)
plot(data3$date,data3$Sub_metering_1,type="s",xlab="Weekday",ylim=yrange,ylab="Energy sub metering")
lines(data3$date,data3$Sub_metering_2,type="s",col="Red",ylim=yrange)
lines(data3$date,data3$Sub_metering_3,type="s",col="Blue",ylim=yrange)
legend(x="topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),col=c("Black","Red","Blue"),cex=0.3)

#####plot4
plot(data3$date,data3$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="l")
dev.off()
