# read in data #
dat <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
dat2 <- dat
dat2$datetime <- strptime(paste(dat2$Date, dat2$Time, sep = " "), "%d/%m/%Y %H:%M:%S") 
# subset data #
dat2$Date <- as.Date(dat2$Date, format = "%d/%m/%Y")
df3 <- subset(dat2, Date == "2007-02-01"|Date == "2007-02-02")

# format submeter data #
df3$Sub_metering_1 <- as.numeric(df3$Sub_metering_1)
df3$Sub_metering_2 <- as.numeric(df3$Sub_metering_2)
df3$Sub_metering_3 <- as.numeric(df3$Sub_metering_3)
# plot #
png("plot3.png", width = 480, height = 480)
plot(df3$datetime, df3$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(df3$datetime, df3$Sub_metering_2, type = "l", col = "red")
lines(df3$datetime, df3$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2, col = c("black", "red", "blue"))
dev.off()