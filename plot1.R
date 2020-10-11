
#Reading and naming data set
pc <- read.table("household_power_consumption.txt",skip=1,sep=";")

#assigning names for columns
names(pc) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#subsetting
subpc <- subset(pc,pc$Date=="1/2/2007" | pc$Date =="2/2/2007")

#plotting graph
hist(as.numeric(as.character(subpc$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")
