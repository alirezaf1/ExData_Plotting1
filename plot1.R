library(lubridate)
data <- read.table("C:/Users/alireza.farhidzadeh/Dropbox/Courses/Exploratory analysis/Week 1/project/household_power_consumption.txt", 
                   sep = ";", na.strings = "?",header = TRUE)
data$Date <- dmy(data$Date)
df <- subset(data, Date>="2007-02-01" & Date<="2007-02-02")
df$Global_active_power <- as.numeric(as.character(df$Global_active_power))
with(df, hist(Global_active_power, col = "red", main = "Global Active Power", 
              xlab = "Global Active Power (kilowatts)"))
dev.copy(png, "plot1.png", width = 480, height = 480)
dev.off()

