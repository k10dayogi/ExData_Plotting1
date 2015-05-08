png(file="plot1.png")
#Run the second line by itself.
data<-read.table("household_power_consumption.txt",header=TRUE,sep=";")
#subset and plot
dates<-data[,1]
dates<-as.Date(dates,format="%d/%m/%Y")
gbl<-data[,3]
gbl<-as.numeric(gbl)
gbl<-gbl/1000
tbl<-data.frame(dates,gbl)
tbl<-subset(tbl,tbl$dates=="2007-02-01"|tbl$dates=="2007-02-02")
hist(tbl$gbl,main="Global Active Power",xlab="Global Active Power (kilowatts)", col="red")
box()
dev.off()