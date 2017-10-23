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
plot(elpowcons_subset$Date_Time, as.numeric(as.character(elpowcons_subset$Global_active_power)), 
     type = "l", xlab = " ", ylab = "Global Active Power (kilowatts)")

# Write png file

dev.copy(png, file = "plot2.png")
dev.off()