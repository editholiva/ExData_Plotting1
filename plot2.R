#Reading the file
df <- read.table("household_power_consumption.txt",header = TRUE, sep = ";")

#Filtering data by dates
dff <- subset(df,df$Date =="1/2/2007" | df$Date == "2/2/2007")
remove(df) #to clean memory
dff$DateTime <- strptime(paste(dff$Date,dff$Time,sep = " "), format ="%d/%m/%Y %H:%M:%S")

#Generate png file
png("plot2.png", width=480, height=480)

#Constructing the plot
plot(dff$DateTime,as.numeric(dff$Global_active_power),type="l", xlab="",ylab="Global Active Power (kilowatts)")

dev.off()