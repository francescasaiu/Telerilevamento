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

ndvi24 = flot(ndvi24, "NDVI-24.jpg")

ndvi25 = flot(ndvi25, "NDVI-25.jpg")

so2.24 = flot(so2_24, "SO2-2024.jpg")

so2.25 = flot(so2_25, "SO2-2025.jpg")


# Plotting the images in true colors one besides the other to show the differences, chronologically
im.multiframe(3,2)
im.plotRGB(et24, r=1, g=2, b=3, title="4 August 2024")
im.plotRGB(et25, r=1, g=2, b=3, title="2 June 2025")

# Plotting the images in false colors one besides the other to show the differences in vegetation health, the more dark the green is the more healty is the vegetation, chronologically
im.plotRGB(ndvi24, r=1, g=2, b=3, title="9 August 2024")
im.plotRGB(ndvi25, r=1, g=2, b=3, title="31 May 2025")

# Plotting images of the different emission of sulfur dioxide between the two explosions, chronologically
im.plotRGB(so2.24, r=1, g=2, b=3, title="4 August 2024")
im.plotRGB(so2.25, r=1, g=2, b=3, title="2 June 2025")






# Function that assigns an image to a variable, flips it and plots it, to speed up the process
flot <- function(x,y){
  x = rast(y)  # assignes the image to a variable
  x = flip(x)  # flipping image
  plot(x)
  return(x)    # the function has as an output the flipped image
}




