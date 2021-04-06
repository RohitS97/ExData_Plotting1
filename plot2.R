elec<-read.csv('household_power_consumption.txt',sep = ";")

df1<-elec[(as.Date(elec$Date,format = '%d/%m/%Y')>=as.Date("01/02/2007",format = '%d/%m/%Y'))&
                  (as.Date(elec$Date,format = '%d/%m/%Y')<=as.Date("02/02/2007",format = '%d/%m/%Y')),]

df3<-df1
df3$DateTime<-paste(df3$Date,df3$Time)

df3$DateTime<-strptime(df3$DateTime,format = "%d/%m/%Y %H:%M:%S")


png(file="plot2.png")
with(df3,plot(DateTime,Global_active_power,type="n"))
with(df3,lines(DateTime,Global_active_power,type="l"))
dev.off()