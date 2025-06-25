# Code part for the exam: Analysis of Etna's plume and sulfur dioxide in atmosphere

# Packages
library(terra)   # for spatial data analysis
library(imageRy) # to analyze raster images with R
library(viridis) # useful for changing color ramp palette

# Setting the working directory
setwd("C:/Users/fsaiu/UNI/MAGISTRALE/TELERILEVAMENTO")

gview = flot(gview, "Italy.jpg")

oc27 = flot(oc27, "27-10.jpg")

oc29 = flot(oc29, "29-10.jpg")

oc30 = flot(oc30, "30-10.jpg")

oc31 = flot(oc31, "31-10.jpg")

nov4 = flot(nov4, "4-11.jpg")

nov7 = flot(nov7, "7-11.jpg")

nov12 = flot(nov12, "12-11.jpg")

nov29 = flot(nov29, "29-11.jpg")

dec30 = flot(dec30, "30-12.jpg")

so2 = flot(so2, "SO2.jpg")



# Plotting the images chronologically to show the evolution of the eruptive plume
im.multiframe(3,3)
plot(oc27)
plot(oc29)
plot(oc30)
plot(oc31)
plot(nov4)
plot(nov7)
plot(nov12)
plot(nov29)
plot(dec30)
# we can see that the eruptive column tends to be transported by the wind and seems to follow a circular path, on November 29th it begins to wane and on December 30th its practically gone

# non mi piace, forse devo fare la sottrazione, domani ci provo
im.multiframe(3,4)
plot(oc27[[1]], col=viridis(100))
plot(oc29[[1]], col=viridis(100))
plot(oc30[[1]], col=viridis(100))
plot(oc31[[1]], col=viridis(100))
plot(nov4[[1]], col=viridis(100))
plot(nov7[[1]], col=viridis(100))
plot(nov12[[1]], col=viridis(100))
plot(nov29[[1]], col=viridis(100))
plot(dec30[[1]], col=viridis(100))



# Function that assigns an image to a variable, flips it and plots it, to speed up the process
flot <- function(x,y){
  x = rast(y)
  x = flip(x)
  plot(x)
  return(x)
}




