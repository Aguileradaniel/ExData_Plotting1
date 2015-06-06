##The decompress data must be on your working directory for the script to be able to run
setwd(YourDirectory)

##Reads only the data from the dates 2007-02-01 and 2007-02-02
datos <- read.csv("household_power_consumption.txt",sep= ";", skip = 66636, nrows=2880, na.strings= "?")

##Reads the headers of the data
cabeceras <- read.csv("household_power_consumption.txt",sep= ";", nrows=1)

##Names the data's headers already provide
names(datos) <- names(cabeceras)

##Opens the PNG device and determinates the size of the png file you want to get
png("plot2.png", width=504, height=504)

##Combines variables Date and Time and converts them in a POSIxlt format
ejex <- as.POSIXlt(paste(as.Date(datos$Date, format="%d/%m/%Y"), datos$Time, sep=" "))

##Diagrams a line plot of the Global Active Power usage through time
plot(ejex, datos$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

##Close de PNG device
dev.off()