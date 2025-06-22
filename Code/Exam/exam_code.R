# Code part for the exam: Analysis of Etna's plume and sulfur dioxide in atmosphere

# Packages
library(terra)   # for spatial data analysis
library(imageRy) # to analyze raster images with R
library(viridis) # useful for changing color ramp palette

# Setting the working directory
setwd("C:/Users/fsaiu/UNI/MAGISTRALE/TELERILEVAMENTO")

gview = rast("Italy.jpg")
plot(gview)
gview = flip(gview)
plot(gview)

oc27 = rast("27-10.jpg")
plot(oc27)
oc27 = flip(oc27)
plot(oc27)

oc28 = rast("28-10.jpg")
plot(oc28)
oc28 = flip(oc28)
plot(oc28)

oc29 = rast("29-10.jpg")
plot(oc29)
oc29 = flip(oc29)
plot(oc29)


oc30 = rast("30-10.jpg")
plot(oc30)
oc30 = flip(oc30)
plot(oc30)

oc31 = rast("31-10.jpg")
plot(oc31)
oc31 = flip(oc31)
plot(oc31)

nov4 = rast("4-11.jpg")
plot(nov4)
nov4 = flip(nov4)
plot(nov4)

nov7= rast("7-11.jpg")
plot(nov7)
nov7 = flip(nov7)
plot(nov7)

nov12 = rast("12-11.jpg")
plot(nov12)
nov12 = flip(nov12)
plot(nov12)

nov19 = rast("19-11.jpg")
plot(nov19)
nov19 = flip(nov19)
plot(nov19)

nov25 = rast("25-11.jpg")
plot(nov25)
nov25 = flip(nov25)
plot(nov25)

nov29 = rast("29-11.jpg")
plot(nov29)
nov29 = flip(nov29)
plot(nov29)

dec30 = rast("30-12.jpg")
plot(dec30)
dec30 = flip(dec30)
plot(dec30)

So2 = rast("SO2.jpg")
plot(So2)
So2 = flip(So2)
plot(So2)




