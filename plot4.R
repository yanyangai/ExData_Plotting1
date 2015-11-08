# read in data #
dat <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
dat2 <- dat
dat2$datetime <- strptime(paste(dat2$Date, dat2$Time, sep = " "), "%d/%m/%Y %H:%M:%S") 
# subset data #
dat2$Date <- as.Date(dat2$Date, format = "%d/%m/%Y")
df3 <- subset(dat2, Date == "2007-02-01"|Date == "2007-02-02")

# convert to numeric variables #
df3$Global_active_power <- as.numeric(df3$Global_active_power)
df3$Sub_metering_1 <- as.numeric(df3$Sub_metering_1)
df3$Sub_metering_2 <- as.numeric(df3$Sub_metering_2)
df3$Sub_metering_3 <- as.numeric(df3$Sub_metering_3)
df3$Voltage <- as.numeric(df3$Voltage)
df3$Global_reactive_power <- as.numeric(df3$Global_reactive_power)
# plot 4 #
png("plot4.png", width = 640, height = 640)
par(mfrow = c(2,2))
plot(df3$datetime, df3$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")
plot(df3$datetime, df3$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")
plot(df3$datetime, df3$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(df3$datetime, df3$Sub_metering_2, type = "l", col = "red")
lines(df3$datetime, df3$Sub_metering_3, type = "l", col = "blue")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1), bty = "n", cex = 1)
plot(df3$datetime, df3$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()






