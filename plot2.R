png(file="plot2.png", width = 480, height = 480)
##READ IN THE DATA
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
data <- subset(data, as.Date(data$Date,"%d/%m/%Y")>="2007-02-01" &
  as.Date(data$Date,"%d/%m/%Y")<="2007-02-02")

##CREATE TIMELINE
x <- paste(as.Date(data$Date,"%d/%m/%Y"), data$Time)
y<-strptime(x, "%Y-%m-%d %H:%M:%S")

##CREATE PLOT
plot(y,as.numeric(as.character(data$Global_active_power)),
  xlab="", ylab="Global Active Power (kilowatts)", type="n")
lines(y,as.numeric(as.character(data$Global_active_power)))
dev.off()