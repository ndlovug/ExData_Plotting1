# read in the data
source("readData.R")

# format datetime as date
hpcraw$datetime <- with(hpcraw, strptime(x = datetime, format = "%d/%m/%Y %H:%M:%S"))

hpcdf <- hpcraw

# set plot size 
png(filename = "plot2.png", width = 480, height = 480, units = "px")

# set no background 
par(bg = NA)

# plot to file device
with(hpcdf, plot(x = datetime, 
                 y = Global_active_power,
                 type = "l", #type = line
                 ylab = "Global Active Power (Kilowatts)", #y-axis title
                 )
)

# copy from screen device to png file device
#dev.copy(png, file = "plot2.png")

# close the file device
dev.off()