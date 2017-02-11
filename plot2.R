#Assumes your pwd is the root of this git repo
#This code will:
# -Load in the household_power_consumption data
# -Subset to the 2 days we're looking at
# -Plots Global Active Power vs Date

data <- read.csv("data/household_power_consumption.txt", sep = ";", na.strings="?", stringsAsFactors=FALSE, dec=".")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Global_active_power <- as.numeric(data$Global_active_power)
data <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

png("plot2.png", width=480, height=480)

plot(data$Global_active_power~data$Datetime, 
     main = "Global Active Power", 
     type = "l",
     xlab = "",
     ylab = "Global Active Power (killowats)", 
     col = "black"
)

dev.off()