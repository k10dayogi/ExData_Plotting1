#Run the first line by itself.
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
png(file="plot4.png")
par(mfrow=c(2,2))
#(1,1) plot
dates<-data[,1]
dates<-as.Date(dates,format="%d/%m/%Y")
gbl<-data[,3]
gbl<-as.numeric(gbl)
gbl<-1000*gbl
tbl<-data.frame(dates,gbl)
tbl<-subset(tbl,tbl$dates=="2007-02-01"|tbl$dates=="2007-02-02")
plot(tbl$gbl,axes=FALSE,pch=".",xlab="",ylab="Global Active Power (kilowatts)")
axis(1,at=c(100,1500,2800),c("Thu","Fri","Sat"))
axis(2,at=c(0,0.001,0.002,0.003),lab=c(0,2,4,6))
lines(tbl$gbl)
box()
#(1,2) plot
dates<-data[,1]
dates<-as.Date(dates,format="%d/%m/%Y")
volt<-data[,5]
volt<-as.numeric(volt)
tbl<-data.frame(dates,volt)
tbl<-subset(tbl,tbl$dates=="2007-02-01"|tbl$dates=="2007-02-02")
plot(tbl$volt,axes=FALSE,pch=".",xlab="datetime",ylab="Voltage")
axis(1,at=c(100,1500,2800),c("Thu","Fri","Sat"))
axis(2)
lines(tbl$volt)
box()
#(2,1) plot
#split data into needed vectors
dates<-data[,1]
dates<-as.Date(dates,format="%d/%m/%Y")
sub1<-data[,7]
sub2<-data[,8]
sub3<-data[,9]
sub1<-as.numeric(sub1)
tbl<-data.frame(dates,sub1,sub2,sub3)
tbl<-subset(tbl,tbl$dates=="2007-02-01"|tbl$dates=="2007-02-02")
#plot information
#plot(tbl$sub1,axes=TRUE,pch=".",xlab="",ylab="Global Active Power (kilowatts)",type="n")
plot(tbl$sub1,axes=FALSE,pch=".",xlab="",ylab="Energy sub metering",type="n")
axis(1,at=c(100,1500,2800),lab=c("Thu","Fri","Sat"))
axis(2,ylim=c(0,30))
points(tbl$sub1,pch=".")
lines(tbl$sub1)
points(tbl$sub2,pch=".")
lines(tbl$sub2,col="red")
points(tbl$sub3,pch=".")
lines(tbl$sub3,col="blue")
legend("topright",pch="--",col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
box()
#(2,2) plot
dates<-data[,1]
dates<-as.Date(dates,format="%d/%m/%Y")
gbl<-data[,4]
gbl<-as.numeric(gbl)
gbl<-gbl/1000
tbl<-data.frame(dates,gbl)
tbl<-subset(tbl,tbl$dates=="2007-02-01"|tbl$dates=="2007-02-02")
plot(tbl$gbl,axes=FALSE,pch=".",xlab="datetime",ylab="global_reactive_power")
axis(1,at=c(100,1500,2800),c("Thu","Fri","Sat"))
axis(2)
lines(tbl$gbl)
box()
dev.off()