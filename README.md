# EDAWeek1Project
This is the first project of the course Exploratory Data Analysis.
The project consist in creating 4 graphs, saving them as pictures and upload the code used to generate them.

The repository contains 8 file:
1) 4 png of the respective graphs
2) 4 .R files used to generate the png files

Each R file is self contained; that means that no other code is required outside the file itself.
The code must run in the same folder where the data file is ( household_power_consumption.txt ) 
Each .R file contains 4 functions:
1) Load.HouseholdPowerConsumptionData
 Loads the data file and adds a couple of columns to help in creating the plots.
 This function is the same in every file
2) CreatePlot
  This function performs the bulk of the routine work: loads the data, employs the plot.function passed as parameter
  to create the png and prints the result on screen as well.
 This function is the same in every file
3) plot[1,2,3,4] 
  This is the function that performs the real work: creating the plots. 
4) CreatePlot[1,2,3,4]
  This function is just a convenient way to call the CreatePlot withouth parameters.
  It is the entry point for each file. Just call it and the png file will be created in the current folder.


Note:
  I tried to avoid loading the whole "household_power_consumption.txt" data file since it is quite big; 
  to achieve this I used the "sqldf" package and the read.csv.sql function. 
  It does not cut the loading times but it saves on memory and maybe computation.


