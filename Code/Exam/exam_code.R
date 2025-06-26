# Code part for the exam: Analysis of the vegetation around Mount Etna and sulfur dioxide in atmosphere

# Packages
library(terra)   # for spatial data analysis
library(imageRy) # to analyze raster images with R
library(viridis) # useful for changing color ramp palette

# Setting the working directory
setwd("C:/Users/fsaiu/UNI/MAGISTRALE/TELERILEVAMENTO")

gview = flot(gview, "Italy.jpg")

et24 = flot(et24, "Mount_Etna_plumes.jpg")

et25 = flot(et24, "Mount_Etna_erupts.jpg")

fc24 = flot(ndvi24, "fc-24.jpg")

fc25 = flot(ndvi25, "fc-25.jpg")

so2.24 = flot(so2_24, "SO2-2024.jpg")

so2.25 = flot(so2_25, "SO2-2025.jpg")


# Plotting the images in true colors one besides the other to show the differences, chronologically
im.multiframe(3,2)
im.plotRGB(et24, r=1, g=2, b=3, title="4 August 2024")
im.plotRGB(et25, r=1, g=2, b=3, title="2 June 2025")

# Plotting the images in false colors one besides the other, chronologically
im.plotRGB(fc24, r=1, g=2, b=3, title="9 August 2024")
im.plotRGB(fc25, r=1, g=2, b=3, title="31 May 2025")

# Plotting images of the different emission of sulfur dioxide between the two explosions, chronologically
im.plotRGB(so2.24, r=1, g=2, b=3, title="4 August 2024")
im.plotRGB(so2.25, r=1, g=2, b=3, title="2 June 2025")

# Calculation of Difference Vegetation Index (DVI)
# 1 = B8 NIR
# 2 = B4 red
# 3 = B3 green

# From true color images we can see that between August 2024 and June 2025, vegetation seems to be restored, that's because they show two different moments of the year, respectively beginning and the end of summer
# With false colors it's possible to subtract NIR band layer with the red band layer obtaining a DVI range
# maximum: NIR - red = 255 - 0 = 255
# minimum: NIR - red = 0 - 255 = -255

# Calculating dvi for 2024
dvi24 = fc24[[1]] - fc24[[2]] # NIR - red
plot(dvi24)
plot(dvi24, col=cividis(100))

# Calculating dvi for 2025
dvi25 = fc25[[1]] - fc25[[2]] # NIR - red
plot(dvi25)
plot(dvi25, col=cividis(100))

# Plotting the results side to side
im.multiframe(1,2)
plot(dvi24, col=cividis(100))
plot(dvi25, col=cividis(100))

# spiega cos'è ndvi e come si calcola, a domani, ciaoooo




# Function that assigns an image to a variable, flips it and plots it, to speed up the process
flot <- function(x,y){
  x = rast(y)  # assignes the image to a variable
  x = flip(x)  # flipping image
  plot(x)
  return(x)    # the function has as an output the flipped image
}




