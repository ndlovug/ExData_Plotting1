# read in the data
library(reshape2)
source("readData.R")

# read in the data
hpcdf <- hpcraw

# format datetime as date
hpcdf$datetime <- with(hpcdf, strptime(x = datetime, format = "%d/%m/%Y %H:%M:%S"))

# set plot size 
png(filename = "plot4.png", width = 480, height = 480, units = "px")

# set no background 
par(bg = NA)

# four plots in one 
par(mfrow = c(2, 2))

# set plot size 
#png(filename = "plot1.png", width = 480, height = 480, units = "px")

# set no background
par(bg = NA)

#####################################################################
# plot 1
with(hpcdf, plot(x = datetime, 
                 y = Global_active_power,
                 type = "l", #type = line
                 ylab = "Global Active Power", #y-axis title
                 xlab = NA
                 )
     )

#####################################################################
# plot 2
with(hpcdf, plot(x = datetime, 
                 y = Voltage,
                 type = "l" #type = line
                 )
     )

#####################################################################
# plot 3

plot3df <- melt(data = hpcraw,  id.vars = "datetime", measure.vars = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") )

# format datetime as date
plot3df$datetime <- with(plot3df, strptime(x = datetime, format = "%d/%m/%Y %H:%M:%S"))

with(plot3df, plot(x = datetime,
                   y = value,
                   type = "n",
                   xlab = NA,
                   ylab = "Energy sub metering"
                   )
     )

with(plot3df, 
     points(x = datetime[variable == "Sub_metering_1"], 
            y = value[variable == "Sub_metering_1"],
            type = "l",
            col = "black"
            )
     )

with(plot3df,
     points(x = datetime[variable == "Sub_metering_2"], 
            y = value[variable == "Sub_metering_2"],
            type = "l",
            col = "red"
            )
     )

with(plot3df,
     points(x = datetime[variable == "Sub_metering_3"], 
            y = value[variable == "Sub_metering_3"],
            type = "l",
            col = "blue"
            )
     )

legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1, 1),
       bty = "n",
       col = c("black", "red", "blue")
       )

#####################################################################
# plot 4

with(hpcdf, plot(x = datetime, 
                 y = Global_reactive_power,
                 type = "l", #type = line
                 )
     )

# close the file device
dev.off()