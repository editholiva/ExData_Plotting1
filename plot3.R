#Reading the file
df <- read.table("household_power_consumption.txt",header = TRUE, sep = ";")

#Filtering data by dates
dff <- subset(df,df$Date =="1/2/2007" | df$Date == "2/2/2007")
remove(df) #to clean memory
dff$DateTime <- strptime(paste(dff$Date,dff$Time,sep = " "), format ="%d/%m/%Y %H:%M:%S")

#Generate png file
png("plot3.png", width=480, height=480)

#Constructing the plot
plot(dff$DateTime,as.numeric(dff$Sub_metering_1),type="l", xlab="", ylab="Energy sub metering")
lines(dff$DateTime,as.numeric(dff$Sub_metering_2),type="l",col="red")
lines(dff$DateTime,as.numeric(dff$Sub_metering_3),type="l",col="blue")
legend("topright",lty=1,col=c("black", "red", "blue"),legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()