library(sqldf)
Load.HouseholdPowerConsumptionData <- function() {
    HPC = read.csv.sql("household_power_consumption.txt"
                       ,header=T     
                       ,sep=";"
                       ,stringsAsFactors=FALSE
                       ,sql = "select * from file where Date ='1/2/2007' or Date='2/2/2007' "
    )
    
    HPC$Date1  <- strptime(HPC$Date, "%d/%m/%Y") 
    HPC$DateAndTime = strptime(paste( HPC$Date1, HPC$Time ), format="%Y-%m-%d %H:%M")
    HPC
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


plot3 <- function(HPC) {
    # Creates the first plot, the histagram
    # Args: 
    #      HPC.DataFrame:  HouseholdPowerConsumption Data Frame 
 
    plot( HPC$DateAndTime, HPC$Sub_metering_1, type="l", xlab = "", ylab = "Energy sub metering" )
    points(HPC$DateAndTime,HPC$Sub_metering_2,col="red",type = "l" )
    points(HPC$DateAndTime,HPC$Sub_metering_3,col="blue",type = "l" )
    legend("topright", legend = c("Sub metering 1","Sub metering 2","Sub metering 3"),
           col= c("black","red","blue"),lwd=c(2.5,2.5),bty="n")
}



CreatePlot3 <- function() {
    par(mfrow = c(1,1) )
    CreatePlot(plot3,"plot3.png")
}
