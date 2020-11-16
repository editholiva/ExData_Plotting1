#Reading the file
df <- read.table("household_power_consumption.txt",header = TRUE, sep = ";")

#Filtering data by dates
dff <- subset(df,df$Date =="1/2/2007" | df$Date == "2/2/2007")
remove(df) #to clean memory
dff$DateTime <- strptime(paste(dff$Date,dff$Time,sep = " "), format ="%d/%m/%Y %H:%M:%S")

#Generate png file
png("plot4.png", width=480, height=480)

#Constructing the plot
par(mfrow=c(2,2))
#Gráfico 1
plot(dff$DateTime,as.numeric(dff$Global_active_power),type="l", xlab="",ylab="Global Active Power (kilowatts)")
#Gráfico 2
plot(dff$DateTime,as.numeric(dff$Voltage),type="l",ylab="Voltage",xlab="datetime")
#Gráfico 3
plot(dff$DateTime,as.numeric(dff$Sub_metering_1),type="l", xlab="", ylab="Energy sub metering")
lines(dff$DateTime,as.numeric(dff$Sub_metering_2),type="l",col="red")
lines(dff$DateTime,as.numeric(dff$Sub_metering_3),type="l",col="blue")
legend("topright",lty=1,bty="n",cex=0.95,col=c("black", "red", "blue"),legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#Gráfico 4
plot(dff$DateTime,as.numeric(dff$Global_reactive_power),type="l",ylab="Global_reactive_power",xlab="datetime")

dev.off()