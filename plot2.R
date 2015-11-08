# read in data #
dat <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
dat2 <- dat
dat2$datetime <- strptime(paste(dat2$Date, dat2$Time, sep = " "), "%d/%m/%Y %H:%M:%S") 
# subset data #
dat2$Date <- as.Date(dat2$Date, format = "%d/%m/%Y")
df3 <- subset(dat2, Date == "2007-02-01"|Date == "2007-02-02")
# convert global power to numeric format #
df3$Global_active_power <- as.numeric(df3$Global_active_power)
# plot #
png("plot2.png", width = 480, height = 480)
plot(df3$datetime, df3$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power(kilowatts)")
dev.off()
