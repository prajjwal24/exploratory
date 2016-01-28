data<- read.csv("household_power_consumption.txt", header = T, sep = ';', 
                      na.strings = "?", nrows = 2075259, check.names = F, 
                      stringsAsFactors = F, comment.char = "", quote = '\"')
data$Date <- as.Date(data$Date,format = "%d/%m/%Y")
data1 <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data)
datetime <- paste(as.Date(data1$Date), data1$Time)
data1$Datetime <- as.POSIXct(datetime)
plot(data1$Global_active_power ~ data1$Datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")

