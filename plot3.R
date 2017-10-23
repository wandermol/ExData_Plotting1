# Set working directory

setwd("D:/Coursera/DS/Course4_Expl/Week1_assignment/")

# Read data

elpowcons <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

# Merge date and time

elpowcons$Date_Time <- apply( elpowcons[ , 1:2 ] , 1 , paste , collapse = " " )

# Dates in date format

elpowcons$Date_Time <- strptime(elpowcons$Date_Time, format = "%d/%m/%Y %H:%M:%S" )
elpowcons$Date <- as.Date(strptime(elpowcons$Date, format = "%d/%m/%Y" ))

# Subset data

log1 <- elpowcons$Date ==  as.Date("2007-02-01") 
log2 <- elpowcons$Date ==  as.Date("2007-02-02")

elpowcons_subset <- rbind(elpowcons[log1, ], elpowcons[log2, ])

# Build plot

windows(width = 480, height = 480)
plot(elpowcons_subset$Date_Time, as.numeric(as.character(elpowcons_subset$Sub_metering_1)), 
     type = "l", xlab = " ", ylab = "Energy sub metering")
points(elpowcons_subset$Date_Time, as.numeric(as.character(elpowcons_subset$Sub_metering_2)), 
       type = "l", col = "red")
points(elpowcons_subset$Date_Time, as.numeric(as.character(elpowcons_subset$Sub_metering_3)), 
       type = "l", col = "blue")
legend("topright", lty = 1 , col = c("black", "red", "blue"), 
       legend = c("sub_metering_1", "sub_metering_2", "sub_metering_3"))

# Write png file

dev.copy(png, file = "plot3.png")
dev.off()