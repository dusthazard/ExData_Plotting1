# Plot One

# Read the data file

df <- read.csv('household_power_consumption.txt',sep=';')

# Convert the date so we can filter

df$Date <- as.Date(df$Date,"%d/%m/%Y")

# Create a subset of the data for the date range to analyze

sub <- subset(df,(Date >= as.Date('2007-02-01')) & (Date <= as.Date('2007-02-02')))

# Convert the time to a date/time format

sub$dateTime <- strptime(paste(sub$Date,sub$Time),format='%Y-%m-%d %H:%M:%S')

# Convert relevant columns to numeric and force NA

sub$Sub_metering_1 <- as.numeric(as.character(sub$Sub_metering_1))
sub$Sub_metering_2 <- as.numeric(as.character(sub$Sub_metering_2))
sub$Sub_metering_3 <- as.numeric(as.character(sub$Sub_metering_3))

# Plot graph

png('plot3.png',width=480,height=480,units='px')

plot(sub$dateTime,sub$Sub_metering_1, type='l',ylab='Energy sub metering',xlab='')

# add lines

lines(sub$dateTime,sub$Sub_metering_2,col='red')
lines(sub$dateTime,sub$Sub_metering_3,col='blue')

# add the legend

legend('topright',legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c('black','red','blue'),lwd=1)

dev.off()
