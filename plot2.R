
pc <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(pc) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subpc <- subset(pc,pc$Date=="1/2/2007" | pc$Date =="2/2/2007")

# Transforming Date and Time variables
subpc$Date <- as.Date(subpc$Date, format="%d/%m/%Y")
subpc$Time <- strptime(subpc$Time, format="%H:%M:%S")
subpc[1:1440,"Time"] <- format(subpc[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subpc[1441:2880,"Time"] <- format(subpc[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

# plotting graph
plot(subpc$Time,as.numeric(as.character(subpc$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)", main="Global Active Power Vs Time") 
