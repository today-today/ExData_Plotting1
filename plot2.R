######plot1
####read in data
temp<-tempfile()
url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,temp,method="curl")
data<-read.table(unz(temp,"household_power_consumption.txt"),header=TRUE,sep=";")
unlink(temp)

######plot
data2<-subset(data,Date == "1/2/2007"|Date == "2/2/2007")
data2$Global_active_power<-as.numeric(data2$Global_active_power)
data2$date<-strptime(paste(data2$Date, data2$Time), "%d/%m/%Y %H:%M:%S")
head(data2)
png(filename="plot2.png")
plot(data2$date,data2$Global_active_power,main="Global Active Power",
     type="l",ylab="Global Active Power(kilowatts)",xlab="Weekday")
dev.off()