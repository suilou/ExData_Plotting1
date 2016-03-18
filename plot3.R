# plot3.R

# 3/17/2016

# Assignment: Course Project 1
#
##############
# Instructions
# 
# This assignment uses data from the UC Irvine Machine Learning Repository, a popular repository for machine learning datasets. In particular, we will be using the "Individual household electric power consumption Data Set" which I have made available on the course web site:
#   
#   Dataset: Electric power consumption [20Mb]
# Description: Measurements of electric power consumption in one household with a one-minute sampling rate over a period of almost 4 years. Different electrical quantities and some sub-metering values are available.
# The following descriptions of the 9 variables in the dataset are taken from the UCI web site:
#   
#   Date: Date in format dd/mm/yyyy
# Time: time in format hh:mm:ss
# Global_active_power: household global minute-averaged active power (in kilowatt)
# Global_reactive_power: household global minute-averaged reactive power (in kilowatt)
# Voltage: minute-averaged voltage (in volt)
# Global_intensity: household global minute-averaged current intensity (in ampere)
# Sub_metering_1: energy sub-metering No. 1 (in watt-hour of active energy). It corresponds to the kitchen, containing mainly a dishwasher, an oven and a microwave (hot plates are not electric but gas powered).
# Sub_metering_2: energy sub-metering No. 2 (in watt-hour of active energy). It corresponds to the laundry room, containing a washing-machine, a tumble-drier, a refrigerator and a light.
# Sub_metering_3: energy sub-metering No. 3 (in watt-hour of active energy). It corresponds to an electric water-heater and an air-conditioner.
#
#################
# Review criteria 
# Criteria
# 
# Was a valid GitHub URL containing a git repository submitted?
# Does the GitHub repository contain at least one commit beyond the original fork?
# Please examine the plot files in the GitHub repository. Do the plot files appear to be of the correct graphics file format?
# Does each plot appear correct?
# Does each set of R code appear to create the reference plot?
# Reviewing the Assignments
# 
# Keep in mind this course is about exploratory graphs, understanding the data, and developing strategies. Here's a good quote from a swirl lesson about exploratory graphs: "They help us find patterns in data and understand its properties. They suggest modeling strategies and help to debug analyses. We DON'T use exploratory graphs to communicate results."
# 
# The rubrics should always be interpreted in that context.
# 
# As you do your evaluation, please keep an open mind and focus on the positive. The goal is not to deduct points over small deviations from the requirements or for legitimate differences in implementation styles, etc. Look for ways to give points when it's clear that the submitter has given a good faith effort to do the project, and when it's likely that they've succeeded. Most importantly, it's okay if a person did something differently from the way that you did it. The point is not to see if someone managed to match your way of doing things, but to see if someone objectively accomplished the task at hand.
# 
# Loading the data 
# When loading the dataset into R, please consider the following:
# 
# The dataset has 2,075,259 rows and 9 columns. First calculate a rough estimate of how much memory the dataset will require in memory before reading into R. Make sure your computer has enough memory (most modern computers should be fine).
# We will only be using data from the dates 2007-02-01 and 2007-02-02. One alternative is to read the data from just those dates rather than reading in the entire dataset and subsetting to those dates.
# You may find it useful to convert the Date and Time variables to Date/Time classes in R using the strptime()  and as.Date() functions.
# Note that in this dataset missing values are coded as ?.
# Making Plotsless 
# Our overall goal here is simply to examine how household energy usage varies over a 2-day period in February, 2007. Your task is to reconstruct the following plots below, all of which were constructed using the base plotting system.
# 
# First you will need to fork and clone the following GitHub repository: https://github.com/rdpeng/ExData_Plotting1
# 
# For each plot you should
# 
# Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
# Name each of the plot files as plot1.png, plot2.png, etc.
# Create a separate R code file (plot1.R, plot2.R, etc.) that constructs the corresponding plot, i.e. code in plot1.R constructs the plot1.png plot. Your code file should include code for reading the data so that the plot can be fully reproduced. You must also include the code that creates the PNG file.
# Add the PNG file and R code file to the top-level folder of your git repository (no need for separate sub-folders)
# When you are finished with the assignment, push your git repository to GitHub so that the GitHub version of your repository is up to date. There should be four PNG files and four R code files, a total of eight files in the top-level folder of the repo.
# 
# The four plots that you will need to construct are shown below.
# 
# Plot 1
# Plot 2
# Plot 3
# Plot 4
#
#############################################################################
# setwd("../Course4_ExploratoryDataAnalysis/Proj1")

rm(list=ls())

list.files()
# [1] "Course4_Proj1.R"                            
# [2] "exdata-data-household_power_consumption.zip"
fid <- unzip("exdata-data-household_power_consumption.zip")
# list.files()
# # [1] "Course4_Proj1.R"                            
# # [2] "exdata-data-household_power_consumption.zip"
# # [3] "household_power_consumption.txt"

# read data
data <- read.table(fid, header=TRUE, sep=";", stringsAsFactors = FALSE)
# str(data)
# # 'data.frame':	2075259 obs. of  9 variables:
# #   $ Date                 : Date, format: "0016-12-20" "0016-12-20" "0016-12-20" "0016-12-20" ...
# # $ Time                 : chr  "17:24:00" "17:25:00" "17:26:00" "17:27:00" ...
# # $ Global_active_power  : chr  "4.216" "5.360" "5.374" "5.388" ...
# # $ Global_reactive_power: chr  "0.418" "0.436" "0.498" "0.502" ...
# # $ Voltage              : chr  "234.840" "233.630" "233.290" "233.740" ...
# # $ Global_intensity     : chr  "18.400" "23.000" "23.000" "23.000" ...
# # $ Sub_metering_1       : chr  "0.000" "0.000" "0.000" "0.000" ...
# # $ Sub_metering_2       : chr  "1.000" "1.000" "2.000" "1.000" ...
# # $ Sub_metering_3       : num  17 16 17 17 17 17 17 17 17 16 ...

# combine date and time
t <- paste(data$Date, data$Time, sep=" ")
# head(t)
# # [1] "16/12/2006 17:24:00" "16/12/2006 17:25:00" "16/12/2006 17:26:00" "16/12/2006 17:27:00" "16/12/2006 17:28:00" "16/12/2006 17:29:00"
t2 <- strptime(t, format="%d/%m/%Y %H:%M:%S",tz="GMT") # time zone is tentative -- need confirmation
# head(t2)
# # [1] "2006-12-16 17:24:00 GMT" "2006-12-16 17:25:00 GMT" "2006-12-16 17:26:00 GMT" "2006-12-16 17:27:00 GMT" "2006-12-16 17:28:00 GMT"
# # [6] "2006-12-16 17:29:00 GMT"
# str(t2)
# # POSIXlt[1:2075259], format: "2006-12-16 17:24:00" "2006-12-16 17:25:00" "2006-12-16 17:26:00" "2006-12-16 17:27:00" "2006-12-16 17:28:00" ...

# # convert date-time to date format
# t <- as.Date(t2)
# # head(t)
# # # [1] "2006-12-16" "2006-12-16" "2006-12-16" "2006-12-16" "2006-12-16" "2006-12-16"
# # str(t)
# # # Date[1:2075259], format: "2006-12-16" "2006-12-16" "2006-12-16" "2006-12-16" "2006-12-16" "2006-12-16" "2006-12-16" "2006-12-16" ...

# reorganize data
data2 <- cbind(t2, data[,3:ncol(data)])
names(data2) <- c("Date", names(data2[,2:ncol(data2)]))

# subset data for plotting
# data3 <- subset(data2, Date >= "2007-02-01 00:00:00" & Date <= "2007-02-03 00:00:00")
# note: somehow the above line subsets starting from 2007-02-01 05:00:00, which is wrong
head(data3)
# Date Global_active_power Global_reactive_power Voltage Global_intensity Sub_metering_1
# 66937 2007-02-01 05:00:00               0.300                 0.090 241.540            1.200          0.000
# 66938 2007-02-01 05:01:00               0.300                 0.088 241.420            1.200          0.000
# 66939 2007-02-01 05:02:00               0.300                 0.088 241.450            1.200          0.000
# 66940 2007-02-01 05:03:00               0.298                 0.086 240.860            1.200          0.000
# 66941 2007-02-01 05:04:00               0.294                 0.084 239.840            1.200          0.000
# 66942 2007-02-01 05:05:00               0.294                 0.082 239.500            1.200          0.000
# Sub_metering_2 Sub_metering_3
# 66937          0.000              0
# 66938          0.000              0
# 66939          0.000              0
# 66940          0.000              0
# 66941          0.000              0
# 66942          0.000              0

# so use lines below instead
idx1 <- grep("2007-02-01 00:00:00",data2$Date)
idx1[1] # 66637
data2$Date[idx1[1]]
# In order to put "Sat" xticklabel on, we need one datapoint on 2/3/2007
idx2 <- grep("2007-02-03 00:00:00",data2$Date) 
idx2[1] # 69517
data2$Date[idx2[1]]
data3 <- data2[idx1[1]:idx2[1],]
head(data3)
# Date Global_active_power Global_reactive_power Voltage Global_intensity Sub_metering_1
# 66637 2007-02-01 00:00:00               0.326                 0.128 243.150            1.400          0.000
# 66638 2007-02-01 00:01:00               0.326                 0.130 243.320            1.400          0.000
# 66639 2007-02-01 00:02:00               0.324                 0.132 243.510            1.400          0.000
# 66640 2007-02-01 00:03:00               0.324                 0.134 243.900            1.400          0.000
# 66641 2007-02-01 00:04:00               0.322                 0.130 243.160            1.400          0.000
# 66642 2007-02-01 00:05:00               0.320                 0.126 242.290            1.400          0.000
# Sub_metering_2 Sub_metering_3
# 66637          0.000              0
# 66638          0.000              0
# 66639          0.000              0
# 66640          0.000              0
# 66641          0.000              0
# 66642          0.000              0

# check missing values; if any, replace missing value (?) with na
grep("[?]", data3) # integer(0) (no missing value so no need for replacement)

# note that data formats were wrong -- need conversion
data3[,2:ncol(data3)] <- sapply(data3[,2:ncol(data3)],as.numeric)
str(data3)
# 'data.frame':	2881 obs. of  8 variables:
#   $ Date                 : POSIXct, format: "2007-02-01 00:00:00" "2007-02-01 00:01:00" "2007-02-01 00:02:00" "2007-02-01 00:03:00" ...
# $ Global_active_power  : num  0.326 0.326 0.324 0.324 0.322 0.32 0.32 0.32 0.32 0.236 ...
# $ Global_reactive_power: num  0.128 0.13 0.132 0.134 0.13 0.126 0.126 0.126 0.128 0 ...
# $ Voltage              : num  243 243 244 244 243 ...
# $ Global_intensity     : num  1.4 1.4 1.4 1.4 1.4 1.4 1.4 1.4 1.4 1 ...
# $ Sub_metering_1       : num  0 0 0 0 0 0 0 0 0 0 ...
# $ Sub_metering_2       : num  0 0 0 0 0 0 0 0 0 0 ...
# $ Sub_metering_3       : num  0 0 0 0 0 0 0 0 0 0 ...
summary(data3)
# Date                     Global_active_power Global_reactive_power    Voltage      Global_intensity
# Min.   :2007-02-01 00:00:00   Min.   :0.220       Min.   :0.0000        Min.   :233.1   Min.   : 1.000  
# 1st Qu.:2007-02-01 12:00:00   1st Qu.:0.320       1st Qu.:0.0000        1st Qu.:238.4   1st Qu.: 1.400  
# Median :2007-02-02 00:00:00   Median :1.062       Median :0.1040        Median :240.6   Median : 4.600  
# Mean   :2007-02-02 00:00:00   Mean   :1.214       Mean   :0.1006        Mean   :240.4   Mean   : 5.105  
# 3rd Qu.:2007-02-02 12:00:00   3rd Qu.:1.690       3rd Qu.:0.1440        3rd Qu.:242.4   3rd Qu.: 7.000  
# Max.   :2007-02-03 00:00:00   Max.   :7.482       Max.   :0.5000        Max.   :246.6   Max.   :32.000  
# Sub_metering_1    Sub_metering_2   Sub_metering_3  
# Min.   : 0.0000   Min.   :0.0000   Min.   : 0.000  
# 1st Qu.: 0.0000   1st Qu.:0.0000   1st Qu.: 0.000  
# Median : 0.0000   Median :0.0000   Median : 0.000  
# Mean   : 0.4061   Mean   :0.2579   Mean   : 8.504  
# 3rd Qu.: 0.0000   3rd Qu.:0.0000   3rd Qu.:17.000  
# Max.   :38.0000   Max.   :2.0000   Max.   :19.000  

##########################################################

# Plot 3
# time series plot of energy sub metering 1, 2, and 3
t <- weekdays(data3$Date, abbreviate=TRUE)
uniqt <- unique(t) # [1] "Thu" "Fri" "Sat"
t2 <- grep(uniqt[1],t)
t2[1] # 1
t[t2[1]] # [1] "Thu"
t3 <- grep(uniqt[2],t)
t3[1] # 1141
t[t3[1]] # [1] "Fri"
t4 <- grep(uniqt[3],t)
t4[1] # 2581
t[t4[1]] # [1] "Sat"

png(file="plot3.png", width=480, height=480)

plot(data3$Date, data3$Sub_metering_1, pch=".",
     ylab="Energy sub metering", xlab="",
     xaxt="n") # xaxt="n" makes xtick and xticklabel invisible
axis(side=1, at=c(data3$Date[t2[1]],data3$Date[t3[1]],data3$Date[t4[1]]), 
     labels=c(t[t2[1]], t[t3[1]], t[t4[1]]),tick=TRUE)
lines(data3$Date, data3$Sub_metering_1, lty=1)
lines(data3$Date, data3$Sub_metering_2, lty=1, col="red")
lines(data3$Date, data3$Sub_metering_3, lty=1, col="blue")
legend("topright", NULL, legend=names(data3[,6:8]),
       lty=c(1,1,1), col=c("black","red","blue"))

dev.off()
dev.cur() # bring back plotting window





