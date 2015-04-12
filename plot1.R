rawdata <- read.table("household_power_consumption.txt", header = TRUE, sep =";", stringsAsFactors=FALSE, dec=".")
subsetData <- rawdata[rawdata$Date %in% c("1/2/2007","2/2/2007") ,]
subsetData$Date <- as.Date(subsetData$Date, format="%d/%m/%Y")
for(i in c(3:9)) {subsetData[,i] <- as.numeric(as.character(subsetData[,i]))}

globalactivepower <- subsetData$Global_active_power

png(filename = "plot1.png", width = 480, height = 480)
hist(globalactivepower, col = "red", main = "Global Active Power", xlab = "Global Active Power(kilowatts)")
dev.off()