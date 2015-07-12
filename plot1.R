
library(sqldf)
Load.HouseholdPowerConsumptionData <- function() {
    hpc = read.csv.sql("household_power_consumption.txt"
                 ,header=T     
                 ,sep=";"
                 ,stringsAsFactors=FALSE
                 ,sql = "select * from file where Date ='1/2/2007' or Date='2/2/2007' "
    )
    
    hpc$Date1  <- strptime(hpc$Date, "%d/%m/%Y") 
    hpc$DateAndTime = strptime(paste( hpc$Date1, hpc$Time ), format="%Y-%m-%d %H:%M")
    hpc
}


CreatePlot <- function(plot.function,filename) {
    
    print("Loading Data file ( only needed observation ). Please wait...")
    HPCData <- Load.HouseholdPowerConsumptionData()
    print("Data file loaded.")
    
    
    ## Create the png file 
    print("Creating png file in the current folder.")
    png(file=filename,width=480,height=480,units="px")
    plot.function(HPCData)
    dev.off()  
    
    ## Show On the screen
    print("png file created, showing plot on the screen device.")
    plot.function(HPCData)
    
}


plot1 <- function(HPC.DataFrame) {
# Creates the first plot, the histagram
# Args: 
#      HPC.DataFrame:  HouseholdPowerConsumption Data Frame 
    
    hist(HPC.DataFrame$Global_active_power, col = c("red"), main="Global Active Power", xlab = "Global Active Power(kilowatts)")
}



CreatePlot1 <- function() {
    par(mfrow = c(1,1) )
    CreatePlot(plot1,"plot1.png")
}


