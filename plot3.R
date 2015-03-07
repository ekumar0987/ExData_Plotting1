# Read data from text file into a data frame. Specify '?' character is na
df<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

#Subset data for 2007-02-01 and 2007-02-02 dates
df<-df[df$Date=='1/2/2007' | df$Date=='2/2/2007',]

# Convert to Date and Time fields to Date-Time class
df$Time<-strptime(paste(df$Date,df$Time),"%d/%m/%Y %H:%M:%S")

#Create plot3.png in working directory
png(filename="plot3.png",width = 480, height = 480)

#Create a plot and send it to the png file
plot(df$Time,df$Sub_metering_1,ylab="Energy sub metering",xlab="",type="l")
lines(df$Time,df$Sub_metering_2,col='red')
lines(df$Time,df$Sub_metering_3,col='blue')
legend("topright",lty=1,col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Close the png file device
dev.off()

