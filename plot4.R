##Course Project - Data Analysis week 1

##Read file
arq = read.table("household_power_consumption.txt", sep=";", header=TRUE, dec=".", stringsAsFactors = FALSE)
##Date as date
arq$Date=as.Date(arq$Date, "%d/%m/%Y")
##subset data frame
comp1=(arq$Date=="2007-02-01") 
comp2=(arq$Date=="2007-02-02")
comp= comp1 | comp2
arq1=arq[comp, ]

##join time and date
tempo=paste(arq1$Date, arq1$Time, sep=" ")
tempo=strptime(tempo, format="%Y-%m-%d %H:%M:%S", tz="GMT")

##open device
png("plot4.png", width=480,height=480)

#set par value
par(mfcol=c(2,2))

##plot1
plot(tempo, arq1$Global_active_power, "l", xlab="", ylab="Global Active Power (kilowats)")

##plot2
plot(tempo, arq1$Sub_metering_1, "l", xlab="", ylab="Energy sub metering")
lines(tempo, arq1$Sub_metering_2, "l", col="red")
lines(tempo, arq1$Sub_metering_3, "l", col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd=1, cex=0.4, col=c("black", "red", "blue"))

##plot3
plot(tempo, arq1$Voltage, "l", ylab="Voltage", xlab="datetime")

##plot4
plot(tempo, arq1$Global_reactive_power, "l", ylab="Global_reactive_power", xlab="datetime")

##close device
dev.off()

