df<-data.frame()
df<-read.table("household_power_consumption.txt", header=TRUE,sep=";", col.names=c("Date", "Time" ,"Global_active_power" ,"Global_reactive_power" ,"Voltage ", "Global_intensity" ,"Sub_metering_1" ,"Sub_metering_2", "Sub_metering_3") ,skip=66637,nrows=2879)

date.time<-paste(as.Date(df$Date,format='%d/%m/%Y'),df$Time)   ##concatnate Date and time
df2 <- transform(df, Date=strptime(date.time,format=  "%Y-%m-%d %H:%M:%S")) #transform date frame with new Date column
df2$Time<-NULL   ## delete Time column since it not needed

png(filename="plot3.png", width=480, height=480, unit="px")
plot(df2$Date,df2$Sub_metering_1,col="black", type="l", ylab="Energy sub metering", xlab="")
points(df2$Date,df2$Sub_metering_2, col="red", type="l")
points(df2$Date,df2$Sub_metering_3, col="blue", type="l")
legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1)
dev.off()