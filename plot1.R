# Plot One

# Read the data file

df <- read.csv('household_power_consumption.txt',sep=';')

# Convert the date so we can filter

df$Date <- as.Date(df$Date,"%d/%m/%Y")

# Create a subset of the data for the date range to analyze

sub <- subset(df,(Date >= as.Date('2007-02-01')) & (Date <= as.Date('2007-02-02')))

# Plot histogram

png('plot1.png',width=480,height=480,units='px')

hist(sub$Global_active_power,col='red',main='Global Active Power',xlab='Global Active Power (kilowatts)',ylab='Frequency')

dev.off()
