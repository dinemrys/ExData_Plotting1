pc <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(pc) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subpc <- subset(pc,pc$Date=="1/2/2007" | pc$Date =="2/2/2007")

# Transforming the Date and Time variables
subpc$Date <- as.Date(subpc$Date, format="%d/%m/%Y")
subpc$Time <- strptime(subpc$Time, format="%H:%M:%S")
subpc[1:1440,"Time"] <- format(subpc[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subpc[1441:2880,"Time"] <- format(subpc[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


# plotting graphs
par(mfrow=c(2,2))
with(ssubpc,{
  plot(subpc$Time,as.numeric(as.character(subpc$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
  plot(subpc$Time,as.numeric(as.character(subpc$Voltage)), type="l",xlab="datetime",ylab="Voltage")
  plot(subpc$Time,subpc$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
   with(subpc,lines(Time,as.numeric(as.character(Sub_metering_1))))
   with(subpc,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
   with(subpc,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
   legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
  plot(subpc$Time,as.numeric(as.character(subpc$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})
