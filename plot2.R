
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
plot(days, as.numeric(as.character(power_sub[['Global_active_power']])), type="l",
      xlab="", ylab="Global Active Power (kilowatts)",xaxt="n")
axis(1, at=c(min(days), min(days)+86400,  min(days)+2*86400),
      labels=c("Thu", "Fri", "Sat"))
dev.off()
