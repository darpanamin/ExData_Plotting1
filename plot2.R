##Read in the data and subset it for the Plot
elec <- read.table("./Rstuff/exdata-data-household_power_consumption/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
elec_sub <- elec[elec$Date %in% c("1/2/2007","2/2/2007"),]


##plot 2
dt <- strptime(paste(elec_sub$Date,elec_sub$Time,sep=" "),"%d/%m/%Y %H:%M:%S")
gap <- as.numeric(elec_sub$Global_active_power)

## open data device
png("plot2.png", width=480, height=480)

plot(dt,gap,type = "l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()