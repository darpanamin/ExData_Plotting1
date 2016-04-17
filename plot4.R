##Read in the data and subset it for the Plot
elec <- read.table("./Rstuff/exdata-data-household_power_consumption/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
elec_sub <- elec[elec$Date %in% c("1/2/2007","2/2/2007"),]


##plot 4
dt <- strptime(paste(elec_sub$Date,elec_sub$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
gap <- as.numeric(elec_sub$Global_active_power)
volt <- as.numeric(elec_sub$Voltage)

sm1<-as.numeric(elec_sub$Sub_metering_1)
sm2<-as.numeric(elec_sub$Sub_metering_2)
sm3<-as.numeric(elec_sub$Sub_metering_3)

## open data device
png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(dt,gap, type="l", xlab="", ylab="Global Active Power")
plot(dt, volt, type="l", xlab="datetime", ylab="Voltage")
plot(dt, sm1, type="l", ylab="Energy Submetering", xlab="")
lines(dt, sm2, type="l", col="red")
lines(dt, sm3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),  lwd=1.5, col=c("black", "red", "blue"))
plot(dt, as.numeric(elec_sub$Global_reactive_power), type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()