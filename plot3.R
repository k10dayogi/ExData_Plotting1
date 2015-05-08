#Run the first line by itself.
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
#split data into needed vectors
png(file="plot3.png")
dates<-data[,1]
dates<-as.Date(dates,format="%d/%m/%Y")
sub1<-data[,7]
sub2<-data[,8]
sub3<-data[,9]
sub1<-as.numeric(sub1)
tbl<-data.frame(dates,sub1,sub2,sub3)
tbl<-subset(tbl,tbl$dates=="2007-02-01"|tbl$dates=="2007-02-02")
#plot informaion
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
dev.off()