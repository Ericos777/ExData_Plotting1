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


##plot bar graph
hist(subset$Global_active_power
     , col = "red"
     , main = "Global Active Power"
     , xlab = "Global Active Power (kilowatts)")


