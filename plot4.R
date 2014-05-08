
#loading the dataset into R
power <- read.csv("./household_power_consumption.txt", sep=";",header = TRUE)

#convert the Date and Time variables to Date/Time classes in R
power$Date<-as.Date(power$Date,"%d/%m/%Y")

#data from the dates 2007-02-01 and 2007-02-02
power_sub=subset(power,power$Date=="2007-02-01" | power$Date=="2007-02-02" ) 

#creation of "days" file
days<- as.POSIXct(as.character(paste(power_sub$Date,power_sub$Time)))

#construct the plot and
#save it to a PNG file with a width of 480 pixels 
#and a height of 480 pixels
png(filename = "plot1.png",width = 480, height = 480)
par(mfrow=c(2,2))

#graph 1
plot(days, as.numeric(as.character(power_sub[['Global_active_power']])), type="l",
     xlab="", ylab="Global Active Power (kilowatts)",xaxt="n")
axis(1, at=c(min(days), min(days)+86400,  min(days)+2*86400),
     labels=c("Thu", "Fri", "Sat"))

#graph2
plot(days, as.numeric(as.character(power_sub[['Voltage']])), type="l",
     xlab="datetime", ylab="Voltage",xaxt="n")
axis(1, at=c(min(days), min(days)+86400,  min(days)+2*86400),
     labels=c("Thu", "Fri", "Sat"))

#graph3
plot(days, as.numeric(as.character(power_sub[['Sub_metering_1']])), type="l",
     xlab="", ylab="Global Active Power (kilowatts)",xaxt="n")
lines(days,as.numeric(as.character(power_sub[['Sub_metering_2']])),  col="red")
lines(days,as.numeric(as.character(power_sub[['Sub_metering_3']])),  col="blue")
axis(1, at=c(min(days), min(days)+86400,  min(days)+2*86400),
     labels=c("Thu", "Fri", "Sat"))
legend('topright', legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
       lty=c(1,1,1) ,col=c('black', 'red', 'blue'))

#graph4
plot(days, as.numeric(as.character(power_sub[['Global_reactive_power']])), type="l",
     xlab="datetime", ylab="Global_reactive_power",xaxt="n")
axis(1, at=c(min(days), min(days)+86400,  min(days)+2*86400),
     labels=c("Thu", "Fri", "Sat"))

dev.off()
