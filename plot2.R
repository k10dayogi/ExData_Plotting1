#Run the first line by itself.
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
#Now run the remainder to generate the plot.
png(file="plot2.png")
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
dev.off()