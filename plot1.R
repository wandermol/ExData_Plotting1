# Set working directory

setwd("D:/Coursera/DS/Course4_Expl/Week1_assignment/")

# Read data

elpowcons <- read.table("household_power_consumption.txt", sep = ";", header = TRUE)

# Dates in date format

elpowcons$Date <- as.Date(strptime(elpowcons$Date, format = "%d/%m/%Y" ))

# Subset data

log1 <- elpowcons$Date ==  as.Date("2007-02-01") 
log2 <- elpowcons$Date ==  as.Date("2007-02-02")

elpowcons_subset <- rbind(elpowcons[log1, ], elpowcons[log2, ])

# Build plot

windows(width = 480, height = 480)
hist(x = as.numeric(as.character(elpowcons_subset$Global_active_power)), 
     xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "red")

# Write png file

dev.copy(png, file = "plot1.png")
dev.off()