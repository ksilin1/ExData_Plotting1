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


# create gap variable that is numeric
gap <- as.numeric(dataset$Global_active_power)

# convert the date variable into date
as.Date(dataset$Date, format="%d/%m/%Y")

# convert time variable into time
strptime(dataset$Time, format="%H:%M:%S")

# create variable dt that contains date and time information:
dt <- strptime(paste(dataset$Date, dataset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 


png("plot2.png", width=480, height=480)
plot(dt, gap, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
