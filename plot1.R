# read in the data
source("readData.R")

hpcdf <- hpcraw

# set plot size 
png(filename = "plot1.png", width = 480, height = 480, units = "px")

# set no background
par(bg = NA)

# plot the histogram to file device
with(hpcdf, hist(x = Global_active_power, 
                 col = "red", #histogram fill color
                 main = paste("Global Active Power"), #main title
                 xlab = "Global Active Power (Kilowatts)", #x-axis title
                 #cex.main = 0.9, #reduce magnification of main title
                 #cex.lab = 0.8, #reduce magnification of x & y labels
                 #cex.axis = 0.75 # reduce magnification for axis annotation
                 )
     )

# close the file device
dev.off()