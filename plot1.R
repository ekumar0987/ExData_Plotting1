# Read data from text file into a data frame. Specify '?' character is na
df<-read.table("household_power_consumption.txt",header=TRUE,sep=";",na.strings="?")

#Subset data for 2007-02-01 and 2007-02-02 dates
df<-df[df$Date=='1/2/2007' | df$Date=='2/2/2007',]

#Create plot1.png in working directory
png(filename="plot1.png",width = 480, height = 480)

#Create a histogram and send it to the png file
hist(df$Global_active_power,col="red",breaks=12,main="Global Active Power",xlab="Global Active Power (kilowatts)")

#Close the png file device
dev.off()


