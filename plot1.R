##The decompress data must be on your working directory for the script to be able to run
setwd(YourDirectory)

##Reads only the data from the dates 2007-02-01 and 2007-02-02
datos <- read.csv("household_power_consumption.txt",sep= ";", skip = 66636, nrows=2880, na.strings= "?")

##Reads the headers of the data
cabeceras <- read.csv("household_power_consumption.txt",sep= ";", nrows=1)

##Names the data's headers already provide
names(datos) <- names(cabeceras)

##Opens the PNG device and determinates the size of the png file you want to get
png("plot1.png", width=504, height=504)

##It provides a frecuency histogram for the Global Active Power, measured in kilowatts.
hist(datos$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

##Close de PNG device
dev.off()