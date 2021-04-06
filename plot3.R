elec<-read.csv('household_power_consumption.txt',sep = ";")

df1<-elec[(as.Date(elec$Date,format = '%d/%m/%Y')>=as.Date("01/02/2007",format = '%d/%m/%Y'))&
                  (as.Date(elec$Date,format = '%d/%m/%Y')<=as.Date("02/02/2007",format = '%d/%m/%Y')),]

df3<-df1
df3$DateTime<-paste(df3$Date,df3$Time)

df3$DateTime<-strptime(df3$DateTime,format = "%d/%m/%Y %H:%M:%S")



png(file="plot3.png")
with(df3,plot(DateTime,Sub_metering_1,type="n",ylab = "Energy Sub metering"))
with(df3,lines(DateTime,Sub_metering_1,type="l"))
with(df3,lines(DateTime,Sub_metering_2,type="l",col="red"))
with(df3,lines(DateTime,Sub_metering_3,type="l",col="blue"))
legend("topright",pch=20,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()