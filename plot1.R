##Course Project - Data Analysis week 1

##Read file
arq = read.table("household_power_consumption.txt", sep=";", header=TRUE, dec=".", stringsAsFactors = FALSE)
arq$Date=as.Date(arq$Date, "%d/%m/%Y")
comp1=(arq$Date=="2007-02-01") 
comp2=(arq$Date=="2007-02-02")
comp= comp1 | comp2
arq1=arq[comp, ]

##Plot graph
##save to PNG file
png("plot1.png", width=480,height=480)
hist(as.numeric(arq1$Global_active_power), col="red", xlab="Global Active Power (kilowats)", ylab="Frequency", main="Global Active Power")
dev.off()
