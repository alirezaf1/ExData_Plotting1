library(lubridate)
data <- read.table("C:/Users/alireza.farhidzadeh/Dropbox/Courses/Exploratory analysis/Week 1/project/household_power_consumption.txt", 
                   sep = ";", stringsAsFactors=FALSE, na.strings = "?",header = TRUE)
data$Date <- dmy(data$Date)
df <- subset(data, Date>="2007-02-01" & Date<="2007-02-02")
datetime <- strptime(paste(df$Date, df$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 

gap <- as.numeric(df$Global_active_power)
volt <- as.numeric(df$Voltage)
subm1 <- as.numeric(df$Sub_metering_1)
subm2 <- as.numeric(df$Sub_metering_2)
subm3 <- as.numeric(df$Sub_metering_3)
grp <- as.numeric(df$Global_reactive_power)


png("plot4.png", width=480, height=480)
par(mfrow = c(2,2))
plot(datetime, gap, type = "l", xlab = "", ylab="Global Active Power")

plot(datetime, volt, type = "l", xlab = "datetime", ylab="Volatage")

plot(datetime, subm1, type = "l", col = "black" , xlab="", ylab="Energy sub metering")
lines(datetime, subm2, type = "l", col = "red")
lines(datetime, subm3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, lwd=1, col = c("black", "red", "blue"))

plot(datetime, grp, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()