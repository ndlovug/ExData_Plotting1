# read in the data
library(reshape2)
source("readData.R")

plot3df <- melt(data = hpcraw,  id.vars = "datetime", measure.vars = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") )

# format datetime as date
plot3df$datetime <- with(plot3df, strptime(x = datetime, format = "%d/%m/%Y %H:%M:%S"))

# set plot size 
png(filename = "plot3.png", width = 480, height = 480, units = "px")

# set no background 
par(bg = NA)

# plot to file device
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
            col = "black")
    )

with(plot3df,
     points(x = datetime[variable == "Sub_metering_2"], 
            y = value[variable == "Sub_metering_2"],
            type = "l",
            col = "red")
    )

with(plot3df,
     points(x = datetime[variable == "Sub_metering_3"], 
            y = value[variable == "Sub_metering_3"],
            type = "l",
            col = "blue")
)

legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty = c(1, 1),
       bty = "n",
       col = c("black", "red", "blue"))

# close the file device
dev.off()