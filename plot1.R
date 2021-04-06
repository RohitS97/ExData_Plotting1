elec<-read.csv('household_power_consumption.txt',sep = ";")

df1<-elec[(as.Date(elec$Date,format = '%d/%m/%Y')>=as.Date("01/02/2007",format = '%d/%m/%Y'))&
                  (as.Date(elec$Date,format = '%d/%m/%Y')<=as.Date("02/02/2007",format = '%d/%m/%Y')),]

df3<-df1
df3$DateTime<-paste(df3$Date,df3$Time)

df3$DateTime<-strptime(df3$DateTime,format = "%d/%m/%Y %H:%M:%S")
print(df3)

png(file="plot1.png")
hist(as.numeric(df3$Global_active_power),col="red",xlab = "Global Active Power (kilowatts)",ylim=c(0,1200))
dev.off()