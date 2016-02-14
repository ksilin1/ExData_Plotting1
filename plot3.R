# Set the working directory to directory where the zip file is using setwd commant,
# for example: setwd("C:/Users/.../Desktop/Coursera/Exploratory data analysis")

# unzip the file, read the table and subset the dates for 1st and 2nd February

a <- read.table(unzip("exdata-data-household_power_consumption.zip"), 
                stringsAsFactors=FALSE,
                header=T, 
                sep=";",
                dec=".",
                na.strings="?"
)

dataset <- subset(a, Date == "1/2/2007" | Date == "2/2/2007")


# convert the date variable into date
as.Date(dataset$Date, format="%d/%m/%Y")

# convert time variable into time
strptime(dataset$Time, format="%H:%M:%S")

# create variable dt that contains date and time information:
dt <- strptime(paste(dataset$Date, dataset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# create gap variable that is numeric
gap <- as.numeric(dataset$Global_active_power)

# Create numeric sub metering variables
sm1 <- as.numeric(dataset$Sub_metering_1)
sm2 <- as.numeric(dataset$Sub_metering_2)
sm3 <- as.numeric(dataset$Sub_metering_3)


png("plot3.png", width=480, height=480)
plot(dt, sm1, type="l", ylab="Energy sub metering", xlab="", col="black")
lines(dt, sm2, type="l", col="red")
lines(dt, sm3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))
dev.off()