# Code part for the exam: Analysis of the vegetation around Mount Etna and sulfur dioxide in atmosphere

# Packages
library(terra)   # for spatial data analysis
library(imageRy) # to analyze raster images with R
library(viridis) # useful for changing color ramp palette

# Setting the working directory
setwd("C:/Users/fsaiu/UNI/MAGISTRALE/TELERILEVAMENTO")

# Assigning images to variables
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
dev.off()  # closes the multiframe window, helps to control graphic devices
---
# Calculation of Difference Vegetation Index (DVI)
# 1 = B8 NIR
# 2 = B4 red
# 3 = B3 green

# From true color images we can see that between August 2024 and June 2025, vegetation seems to be restored, that's because they show two different moments of the year, respectively beginning and end of summer
# With false colors images it is possible to subtract NIR (Near InfraRed) band layer with the red band layer obtaining a DVI range
# maximum: NIR - red = 255 - 0 = 255
# minimum: NIR - red = 0 - 255 = -255

# Calculating dvi for year 2024
dvi24 = fc24[[1]] - fc24[[2]] # NIR - red
plot(dvi24, col=cividis(100))

# Calculating dvi for year 2025
dvi25 = fc25[[1]] - fc25[[2]] # NIR - red
plot(dvi25, col=cividis(100))

# Plotting the results side to side
im.multiframe(1,2)
plot(dvi24, col=cividis(100))
plot(dvi25, col=cividis(100))
dev.off()

# The NDVI (Normal Difference Vegetation Index) is the final goal, it assesses vegetation health by measuring the ratio between the difference of NIR and red (DVI) and their sum
# Healthy vegetation tends to absorb red light due to photosythesis, meanwhile stressed vegetation reflects it, thanks to this behaviour it is possible to have direct information on vegetation health status

# Healthy tree:  NIR=255  red=0   DVI= NIR-red= 255
# Stressed tree: NIR=100  red=20  DVI= NIR-red= 100-20= 80   (example)

# Calculating NDVI for year 2024
ndvi24 = dvi24 / (fc24[[1]] + fc24[[2]])
plot(ndvi24)

# Calculating NDVI for year 2025
ndvi25 = dvi25 / (fc25[[1]] + fc25[[2]])
plot(ndvi25)

# Plotting the results side to side
im.multiframe(1,2)
plot(ndvi24, col=cividis(100))
plot(dvi25, col=cividis(100))
dev.off()
***
# Using imageRy this process is faster and it only needs two functions, here is an example
dvi24auto = im.dvi(fc24, 1, 2)
plot(dvi24auto, col=cividis(100))
ndvi24auto = im.ndvi(fc24, 1, 2)
plot(ndvi24auto, col=cividis(100))

# Comparing the two results, the two images must show the same thing
im.multiframe(1,2)
plot(ndvi24, col=cividis(100))
plot(ndvi24auto, col=cividis(100))
dev.off()
***
# 
plot(ndvi24, ndvi25, xlim=c(-0.3,0.9), ylim=c(-0.3, 0.9))
abline(0, 1, col="#6600ff", lwd=2)


---
# Creating collages with graphics with results and images for markdown script
# True color images nest to each other
pdf("Etnas-eruptions.pdf")
im.multiframe(1,2)
im.plotRGB(et24, r=1, g=2, b=3, title="4 August 2024")
im.plotRGB(et25, r=1, g=2, b=3, title="2 June 2025")
dev.off()
# NDVI
getwd()
pdf("ndviout.pdf")
im.multiframe(2,2)
plot(ndvi24, col=cividis(100))
plot(dvi25, col=cividis(100))
plot(ndvi24, ndvi25, xlim=c(-0.3,0.9), ylim=c(-0.3, 0.9), ylab="June 2025", xlab="August 2024")
abline(0, 1, col="#6600ff", lwd=2)
dev.off()


---
# SO2 differenza

# classificazione per intensità SO2 se ci riesco
#

# Function that assigns an image to a variable, flips it and plots it, to speed up the process
flot <- function(x,y){
  x = rast(y)  # creates a variable that contains the image
  x = flip(x)  # flipping image
  plot(x)
  return(x)    # outputs the rotated image
}




