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

# create numeric variable
gap <- as.numeric(dataset$Global_active_power)

# plot histogram

png("plot1.png", width=480, height=480)
hist(gap,
     main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     # xlim = c(0,6),
     ylab="Frequency",
     col="red",
     breaks=24
)

dev.off()