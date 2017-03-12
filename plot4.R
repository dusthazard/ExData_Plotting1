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
sub$Voltage <- as.numeric(as.character(sub$Voltage))
sub$Global_reactive_power <- as.numeric(as.character(sub$Global_reactive_power))

# open a png

png('plot4.png',width=480,height=480,units='px')

# set multiple plot columns/rows

par(mfcol=c(2,2),mar=c(4,5,1,1))

# Plot the top left graph

plot(sub$dateTime,sub$Global_active_power, type='l',ylab='Global Active Power (kilowatts)',xlab='')

# Plot the bottom left graph

plot(sub$dateTime,sub$Sub_metering_1, type='l',ylab='Energy sub metering',xlab='')

# add lines

lines(sub$dateTime,sub$Sub_metering_2,col='red')
lines(sub$dateTime,sub$Sub_metering_3,col='blue')

# add the legend

legend('topright',legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),col=c('black','red','blue'),lwd=1)

# Plot the top right graph

plot(sub$dateTime,sub$Voltage, type='l',ylab='Voltage',xlab='datetime')

# Plot the bottom right graph

plot(sub$dateTime,sub$Global_reactive_power,type='l',ylab='Global_reactive_power',xlab='datetime')

dev.off()
