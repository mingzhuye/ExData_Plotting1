rawdata <- read.table("household_power_consumption.txt", header = TRUE, sep =";", stringsAsFactors=FALSE, dec=".")
subsetData <- rawdata[rawdata$Date %in% c("1/2/2007","2/2/2007") ,]
subsetData$Date <- as.Date(subsetData$Date, format="%d/%m/%Y")
for(i in c(3:9)){subsetData[,i] <- as.numeric(as.character(subsetData[,i]))}
subsetData$Date_Time <- paste(subsetData$Date, subsetData$Time)
datetime <- strptime(subsetData$Date_Time, format="%Y-%m-%d %H:%M:%S")

globalactivepower <- subsetData$Global_active_power

png(filename = "plot2.png", width = 480, height = 480)
plot(datetime, globalactivepower, xlab="", ylab="Global Active Power (kilowatts)", type ="l")
dev.off()