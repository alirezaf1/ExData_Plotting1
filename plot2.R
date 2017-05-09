library(lubridate)
data <- read.table("C:/Users/alireza.farhidzadeh/Dropbox/Courses/Exploratory analysis/Week 1/project/household_power_consumption.txt", 
                   sep = ";", stringsAsFactors=FALSE, na.strings = "?",header = TRUE)
data$Date <- dmy(data$Date)
df <- subset(data, Date>="2007-02-01" & Date<="2007-02-02")
datetime <- strptime(paste(df$Date, df$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 
png("plot2.png", width=480, height=480)
plot(datetime, df$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
