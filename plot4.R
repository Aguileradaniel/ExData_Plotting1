##The decompress data must be on your working directory for the script to be able to run
setwd(YourDirectory)

##Reads only the data from the dates 2007-02-01 and 2007-02-02
datos <- read.csv("household_power_consumption.txt",sep= ";", skip = 66636, nrows=2880, na.strings= "?")

##Reads the headers of the data
cabeceras <- read.csv("household_power_consumption.txt",sep= ";", nrows=1)

##Names the data's headers already provide
names(datos) <- names(cabeceras)

##Opens the PNG device and determinates the size of the png file you want to get
png("plot4.png", width=504, height=504)

##Combines variables Date and Time and converts them in a POSIxlt format
ejex <- as.POSIXlt(paste(as.Date(datos$Date, format="%d/%m/%Y"), datos$Time, sep=" "))

##Sets the layout to 2 rows x 2 columns columnwise
par(mfcol=c(2,2))

##Diagrams a line plot of the Global Active Power usage through time in the first row of the first column
plot(ejex, datos$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")

##Diagrams a line plot comparing diferent Sub Metering variables through out time in the second row of the first column
plot(ejex, datos$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(ejex, datos$Sub_metering_2, type="l",col="red", ylab="Energy sub metering", xlab="")
lines(ejex, datos$Sub_metering_3, type="l",col="blue", ylab="Energy sub metering", xlab="")
legend("topright", lty = 1, bty="n", col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

##Diagrams a line plot of the Voltage usage through out time in the first row of the second column
plot(ejex, datos$Voltage, type="l", ylab="Voltage", xlab="datetime")

##Diagrams a line plot of the Global Reactive Power usage through out time in the second row of the second column
plot(ejex, datos$Global_reactive_power, type="l",ylab="Global_reactive_power", xlab="datetime")

##Close de PNG device
dev.off()