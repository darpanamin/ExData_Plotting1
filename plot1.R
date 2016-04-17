##Read in the data and subset it for the Plot
elec <- read.table("./Rstuff/exdata-data-household_power_consumption/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
elec_sub <- elec[elec$Date %in% c("1/2/2007","2/2/2007"),]


##plot 1

## open data device
png("plot1.png", width=480, height=480)

with(elec_sub,hist(as.numeric(Global_active_power), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")) 

dev.off()