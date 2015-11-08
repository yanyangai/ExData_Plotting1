# read in data #
dat <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
dat2 <- dat
# format date and time variable #  
dat2$datetime <- strptime(paste(dat2$Date, dat2$Time, sep = " "), "%d/%m/%Y %H:%M:%S") 
# subset data #
dat2$Date <- as.Date(dat2$Date, format = "%d/%m/%Y")
df3 <- subset(dat2, Date == "2007-02-01"|Date == "2007-02-02")
# format global active power #
df3$Global_active_power <- as.numeric(df$Global_active_power)
# first plot #
png("plot1.png", width = 480, height = 480)
hist(df3$Global_active_power, col = "red", main = "Global Active Power", xlab="Global Active Power(kilowatts)")
# save plot #
dev.off()
