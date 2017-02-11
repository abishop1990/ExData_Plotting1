#Assumes your pwd is the root of this git repo
#This code will:
# -Load in the household_power_consumption data
# -Subset to the 2 days we're looking at
# -Plots global active power histogram

data <- read.csv("data/household_power_consumption.txt", sep = ";", stringsAsFactors=FALSE, dec=".")
data <- subset(data, Date == '2/1/2007' | Date == '2/2/2007')

png("plot1.png", width=480, height=480)

hist(as.numeric(data$Global_active_power), 
     main = "Global Active Power", 
     xlab = "Global Active Power (killowats)", 
     col = "red"
)

dev.off()