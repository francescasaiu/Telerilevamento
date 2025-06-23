# Code part for the exam: Analysis of Etna's plume and sulfur dioxide in atmosphere

# Packages
library(terra)   # for spatial data analysis
library(imageRy) # to analyze raster images with R
library(viridis) # useful for changing color ramp palette

# Setting the working directory
setwd("C:/Users/fsaiu/UNI/MAGISTRALE/TELERILEVAMENTO")

gview = rast("Italy.jpg")
flot(gview)

oc27 = rast("27-10.jpg")
flot(oc27)

oc28 = rast("28-10.jpg")
flot(oc28)

oc29 = rast("29-10.jpg")
flot(oc29)

oc30 = rast("30-10.jpg")
flot(oc30)

oc31 = rast("31-10.jpg")
flot(oc31)

nov4 = rast("4-11.jpg")
flot(nov4)

nov7= rast("7-11.jpg")
flot(nov7)

nov12 = rast("12-11.jpg")
flot(nov12)

nov19 = rast("19-11.jpg")
flot(nov19)

nov25 = rast("25-11.jpg")
flot(nov25)

nov29 = rast("29-11.jpg")
flot(nov29)

dec30 = rast("30-12.jpg")
flot(dec30)

So2 = rast("SO2.jpg")
flot(So2)


# function that flips and plots the image
flot <- function(x) {
  x=flip(x)
  plot(x)
}




