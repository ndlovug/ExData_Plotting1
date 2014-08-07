# clear list
rm(list = ls())

# load library
library(sqldf)

# path and file string
hpcfile <- "exdata-data-household_power_consumption/household_power_consumption.txt"

## read file and select rows based on string "1/1/2007" and store in dataframe DF
hpcraw <- read.csv.sql(hpcfile, sep=";",sql = 'Select * From file where Date = "1/2/2007" OR Date = "2/2/2007" ')

# close connection
sqldf()

# check to see if there's missing data
# which(apply(X = hpcraw, MARGIN = 2, FUN = function(x) any(grepl("\\?", x))))

# concatenate Date & Time columns to create a datetime column
hpcraw$datetime <- with(hpcraw, paste(Date, Time, sep = " "))

# format datetime as date
hpcraw$datetime <- with(hpcraw, strptime(x = datetime, format = "%d/%m/%Y %H:%M:%S"))



