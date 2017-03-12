# Plot One

# Read the data file

df <- read.csv('household_power_consumption.txt',sep=';')

# Convert the date so we can filter

df$Date <- as.Date(df$Date,"%d/%m/%Y")

# Create a subset of the data for the date range to analyze

sub <- subset(df,(Date >= as.Date('2007-02-01')) & (Date <= as.Date('2007-02-02')))

# Convert the time to a date/time format

sub$dateTime <- strptime(paste(sub$Date,sub$Time),format='%Y-%m-%d %H:%M:%S')

# Plot histogram

png('plot2.png',width=480,height=480,units='px')

plot(sub$dateTime,sub$Global_active_power, type='n',ylab='Global Active Power (kilowatts)')

lines(sub$dateTime,sub$Global_active_power)

dev.off()
