#Reading the file
df <- read.table("household_power_consumption.txt",header = TRUE, sep = ";")

#Filtering data by dates
df$Date <- as.Date(df$Date, format= "%d/%m/%Y")
dff <- subset(df,Date >="2007-02-01" & Date <="2007-02-02")
remove(df) #to clean memory

#Generate png file
png("plot1.png", width=480, height=480)

#Constructing the plot
hist(as.numeric(dff$Global_active_power),col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

dev.off()