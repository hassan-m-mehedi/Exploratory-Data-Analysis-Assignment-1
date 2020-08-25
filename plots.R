
# Downloading the file
file_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(file_url, dest= "C:\\Users\\mehedi\\Desktop\\Coursera\\Exploratory-Data-Analysis-Assignment-1.zip", method = "curl")

# Unzipping the file
unzip("C:\\Users\\mehedi\\Desktop\\Coursera\\Exploratory-Data-Analysis-Assignment-1.zip")

#reading the file
data <- read.table("C:\\Users\\mehedi\\Desktop\\Coursera\\Exploratory-Data-Analysis-Assignment-1\\household_power_consumption.txt", header = TRUE, sep =";", stringsAsFactors = FALSE, dec = "." )

#Subsetting data from 2007-02-01 to 2007-02-02
subset_data <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

# Assigning into variable names
global_active_power <- as.numeric(subset_data$Global_active_power)
global_reactive_power <- as.numeric(subset_data$Global_reactive_power)
voltage <- as.numeric(subset_data$Voltage)
sub_metering_1 <- as.numeric(subset_data$Sub_metering_1)
sub_metering_2 <- as.numeric(subset_data$Sub_metering_2)
sub_metering_3 <- as.numeric(subset_data$Sub_metering_3)

#Constructing histogram
hist(global_active_power, col = "red", main= "Global Active Power", xlab = "Global Active Power(kilowatts)")

# png file
dev.copy(png, file= "plot1.png", height= 480, width= 480)
dev.off()



#Constructing time series plot
date_time <- strptime(paste(subset_data$Date, subset_data$Time, sep= ""), "%d/%m/%Y %H:%M:%S")
plot(date_time, global_active_power, type = "l",xlab = "", ylab = "Global Active Power(kilowatts)")

# png file
dev.copy(png, file= "plot2.png", height= 480, width= 480)
dev.off()



# Constructing sub-metering plot
plot(date_time, sub_metering_1, type = "l", ylab = "Energy Submetering", xlab = "")
lines(date_time, sub_metering_2, type = "l", col= "red")
lines(date_time, sub_metering_3,type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty = 1, lwd= 2.5, col= c("black", "red", "blue"))

# png file
dev.copy(png, file= "plot3.png", height= 480, width= 480)
dev.off()



#Constructing multiple plots
 par(mfrow= c(2,2))
 plot(date_time, global_active_power, type = "l",xlab = "", ylab = "Global Active Power(kilowatts)", cex=0.2)
 plot(date_time, voltage, type = "l", xlab= "Date Time", ylab = "Voltage")
 plot(date_time, sub_metering_1, type = "l", ylab = "Energy Submetering", xlab = "")
 lines(date_time, sub_metering_2, type = "l", col= "red")
 lines(date_time, sub_metering_3,type = "l", col = "blue")
 legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty = 1, lwd= 2.5, col= c("black", "red", "blue"), bty = "o")
 plot(date_time, global_reactive_power, type = "l", xlab = "Date Time", ylab = "Global Reactive Power", cex=0.2)

 # png file
 dev.copy(png, file= "plot4.png", height= 480, width= 480)
 dev.off()
 
 
 
 