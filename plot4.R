png(file="plot4.png", width = 480, height = 480)
##READ IN THE DATA
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
data <- subset(data, as.Date(data$Date,"%d/%m/%Y")>="2007-02-01" &
  as.Date(data$Date,"%d/%m/%Y")<="2007-02-02")

##CREATE TIMELINE
x <- paste(as.Date(data$Date,"%d/%m/%Y"), data$Time)
y<-strptime(x, "%Y-%m-%d %H:%M:%S")

par(mfcol=c(2,2))
##PLOT(1,1)
plot(y,as.numeric(as.character(data$Global_active_power)),
  xlab="", ylab="Global Active Power", type="n")
lines(y,as.numeric(as.character(data$Global_active_power)))

##PLOT(2,1)
plot(y,as.numeric(as.character(data$Sub_metering_1)),
  xlab="", ylab="Energy sub metering", type="n")
lines(y,as.numeric(as.character(data$Sub_metering_1)))
lines(y,as.numeric(as.character(data$Sub_metering_2)),col="red")
lines(y,as.numeric(as.character(data$Sub_metering_3)),col="blue")
legend("topright", bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
  col=c("black","red","blue"), lty=c(1,1,1))

##NEWPLOT(1,2)
plot(y,as.numeric(as.character(data$Voltage)),
  xlab="datetime", ylab="Voltage", type="n")
lines(y,as.numeric(as.character(data$Voltage)))

##NEWPLOT(2,2)
plot(y,as.numeric(as.character(data$Global_reactive_power)),
  xlab="datetime", ylab="Global_reactive_power", type="n")
lines(y,as.numeric(as.character(data$Global_reactive_power)))
dev.off()
