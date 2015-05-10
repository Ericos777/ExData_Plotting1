##read data
data <- read.table("household_power_consumption.txt", header = TRUE ,sep = ";",na.strings = "?")
##subset data

##convert date and time columns
data$Date <- as.Date(data$Date , format ="%d/%m/%Y")
data$Time <- strftime(data$Time, format = "%H:%M:%S")

#subset data
subset <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",] 

##add timestamp for plotting convenience
subset$Timestamp <- as.POSIXct(paste(subset$Date, subset$Time), format="%Y-%m-%d %H:%M:%S")

#main plot for submeter 1 adding axis
plot(subset$Timestamp
     , subset$Sub_metering_1
     , type = "l"
     , xlab = ""
     , ylab = "Energy sub metering")

##add submeter 2
lines(subset$Timestamp
      , subset$Sub_metering_2
      , type = "l"
      , col = "red" )

##add submeter 3
lines(subset$Timestamp
      , subset$Sub_metering_3
      , type = "l"
      , col = "blue" )

##add Legend
legend("topright"
       ,lty=1
       , col = c("Black", "red", "blue")
       , legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
