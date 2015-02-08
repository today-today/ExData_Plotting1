######plot1
####read in data
temp<-tempfile()
url<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,temp,method="curl")
data<-read.table(unz(temp,"household_power_consumption.txt"),header=TRUE,sep=";")
unlink(temp)

######plot
data1<-subset(data,Date == "1/2/2007"|Date == "2/2/2007")
data1$Global_active_power<-as.numeric(data1$Global_active_power)
head(data1)
png(filename="plot1.png")
hist(data1$Global_active_power,col="red",main="Global Active Power",
     xlab="Global Active Power(kilowatts)")
dev.off()