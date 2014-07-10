png(file="plot1.png", width = 480, height = 480)
##READ IN THE DATA
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";")
data <- subset(data, as.Date(data$Date,"%d/%m/%Y")>="2007-02-01" &
  as.Date(data$Date,"%d/%m/%Y")<="2007-02-02")

##CREATE HISTOGRAM
hist(as.numeric(as.character(data$Global_active_power)), col="red", 
  main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
