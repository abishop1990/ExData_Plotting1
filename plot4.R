#Assumes your pwd is the root of this git repo
#This code will:
# -Load in the household_power_consumption data
# -Subset to the 2 days we're looking at
# -Plots Various Graphs 

data <- read.csv("data/household_power_consumption.txt", sep = ";", na.strings="?", stringsAsFactors=FALSE, dec=".")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Global_active_power <- as.numeric(data$Global_active_power)
data <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

png("plot4.png", width=480, height=480)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data, {
  plot(
    Global_active_power~Datetime, 
    type="l", 
    ylab="Global Active Power (kilowatts)",
    xlab=""
  )
  
  plot(
    Voltage~Datetime, 
    type="l", 
    ylab="Voltage (volt)",
    xlab=""
  )
  
  plot(
    Sub_metering_1~Datetime, 
    type="l",
    ylab="Global Active Power (kilowatts)", 
    xlab=""
  )
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')

  legend(
    "topright",
    col=c("black", "red", "blue"), 
    lty=1, 
    lwd=2, 
    legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
  )
  
  plot(
    Global_reactive_power~Datetime, 
    type="l", 
    ylab="Global Rective Power (kilowatts)",
    xlab=""
  )
})


dev.off()