# read in the data
source("readData.R")

hpcdf <- hpcraw

par(bg = NA)

# plot the histogram to screen device
with(hpcdf, hist(x = Global_active_power, 
                 col = "red", #histogram fill color
                 main = paste("Global Active Power"), #main title
                 xlab = "Global Active Power (Kilowatts)", #x-axis title
                 cex.main = 0.9, #reduce magnification of main title
                 cex.lab = 0.8, #reduce magnification of x & y labels
                 cex.axis = 0.75 # reduce magnification for axis annotation
                 )
     )


# copy from screen device to png file device
dev.copy(png, file = "plot1.png")

# close the file device
dev.off()