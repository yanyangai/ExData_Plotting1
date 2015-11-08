# read in data #
dat <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
# convert date and time variables #
# second, format date and time variable #  
dat$Date <- as.Date(dat$Date, "%d/%m/%Y")
dat$new <- format(as.POSIXct(paste(dat$Date, dat$Time)), "%d/%m/%Y %H:%M:%S")
dat$new <- strptime(dat$new, format = "%d/%m/%Y %H:%M:%S")
# subset the dataset #
df <- subset(dat, Date == "2007-02-02"|Date == "2007-02-01")

# format global active power #
df$Global_active_power <- as.numeric(df$Global_active_power)
# first plot #

