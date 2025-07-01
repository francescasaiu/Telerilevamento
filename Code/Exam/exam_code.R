# Code part for the exam: Analysis of the vegetation around Mount Etna and sulfur dioxide in atmosphere

# Packages
library(terra)      # for spatial data analysis
library(imageRy)    # to analyze raster images with R
library(viridis)    # useful for changing color ramp palette
library(patchwork)  #
library(ggplot2)    #

# Setting the working directory
setwd("C:/Users/fsaiu/UNI/MAGISTRALE/TELERILEVAMENTO")

# Assigning images to variables
gview = flot(gview, "Italy.jpg")

et24 = flot(et24, "Mount_Etna_plumes.jpg")

et25 = flot(et24, "Mount_Etna_erupts.jpg")

fc24 = flot(ndvi24, "fc-24.jpg")

fc25 = flot(ndvi25, "fc-25.jpg")

so2d24= flot(so2d24, "2024_so2d.jpg")

so2d25 = flot(so2d25, "2025_so2d.jpg")

so2.24 = flot(so2_24, "SO2-2024.jpg")

so2.25 = flot(so2_25, "SO2-2025.jpg")

# Plotting images in true colors one besides the other to show the differences, chronologically
im.multiframe(4,2)
im.plotRGB(et24, r=1, g=2, b=3, title="4 August 2024")
im.plotRGB(et25, r=1, g=2, b=3, title="2 June 2025")

# Plotting images in false colors one besides the other, chronologically
im.plotRGB(fc24, r=1, g=2, b=3, title="9 August 2024")
im.plotRGB(fc25, r=1, g=2, b=3, title="31 May 2025")

# Plotting images that schematically represents emission of sulfur dioxide between the two paroxysms, chronologically
im.plotRGB(so2d24, r=1, g=2, b=3, title="4 August 2024")
im.plotRGB(so2d25, r=1, g=2, b=3, title="2 June 2025")

# Plotting images of sulfur dioxide emission for analisys, chronologically
im.plotRGB(so2.24, r=1, g=2, b=3, title="4 August 2024")
im.plotRGB(so2.25, r=1, g=2, b=3, title="2 June 2025")
dev.off()  # closes the multiframe window, helps to control graphic devices

#---
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

# Calculating the difference between the two NDVI, 2025-2024
ndvidiff = ndvi25 - ndvi24

#***
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
#***

# To directly compare NDVI values between the two dates, results are plotted in a cartesian graph and it is added a bisector for reference
# x = 2024, y = 2025, if x = y NDVI has not changed within the time period
# All values above the bisector indicate an improvement of vegetation wellness, all below instead show worsening conditions
# In this case the majority of data is located upon the line and that means that the vegetation is more lush and dense than 2024, as per above 
plot(ndvi24, ndvi25, xlim=c(-0.3,0.9), ylim=c(-0.3, 0.9), ylab="June 2025", xlab="August 2024")  # graph
abline(0, 1, col="#6600ff", lwd=2)                                                               # bisector
dev.off()

#---
# Using the other set of images, showing sulfur dioxide emission, it is possible to calculate the different quantity of product considering only one band
# It is possible to see the sulfur dioxide plume of the year 2024 in darker colors and with the brighter colors this years plume.
# Both plumes' spreading are affected by the presence or absence of the wind, in fact they do not follow the same path
so2d = so2.25[[1]] - so2.24[[1]]
im.multiframe(2,2)
plot(so2.24, col=cividis(100))
plot(so2.25, col=cividis(100))
plot(so2d, col=cividis(100))
dev.off()

# Calculating how far the values deviate from their average using the latter variable
sd = focal(so2d, w=c(3,3), fun="sd")            # standard deviation (sd) with 3x3 pixels moving window
sd24 = focal(so2.24[[1]], w=c(3,3), fun="sd")
sd25 = focal(so2.25[[1]], w=c(3,3), fun="sd")
p0 = im.ggplot(sd)                              # plotting sd with a ggplot graphic
p1 = im.ggplot(sd24)
p2 = im.ggplot(sd25)
p0+p1+p2                                        # using package "patchwork", plotting the graphics one beside the other

# From standard deviation should be easy to extrapolate the variance index, sum of the square deviations divided by the number of deviations
var = sd^2
p4 = im.ggplot(var)
p0+p1+p2+p4                                     # using package "patchwork", plotting the graphics one beside the other

# Classification by intensity of sulfur dioxide plume
so2d24c = im.classify(so2d24, num_clusters=4)
so2d25c = im.classify(so2d25, num_clusters=4)

# 2024             2025
# 1 = high         4 = high
# 4 = medium-high  3 = medium-high
# 2 = medium-low   1 = medium-low
# 3 = low          2 = low

# Plotting normal and classified images together to compare
im.multiframe(2,2)
plot(so2d24)
plot(so2d24c)
plot(so2d25)
plot(so2d25c)

# Making a correct legend
so2d24cs = subst(so2d24c, c(3,2,4,1), c("01_low","02_medium-low","03_medium-high", "04_high"))
so2d25cs = subst(so2d25c, c(2,1,3,4), c("01_low","02_medium-low","03_medium-high", "04_high"))
im.multiframe(1,2)
plot(so2d24cs)
plot(so2d25cs)

#
perc24 = freq(so2d24cs)$count*100/ncell(so2d24cs) #  95.3326461  2.7109013  1.0474537  0.9089988
perc25 = freq(so2d25cs)$count*100/ncell(so2d25cs) # 92.1956742  6.7387876  0.7452257  0.3203125

# Create dataframe with all the new data
class = c("01_low","02_medium-low","03_medium-high", "04_high")
perc_24 = c(95.33,2.71,1.04,0.91)
perc_25 = c(92.20,6.74,0.74,0.32)
tabso2 = data.frame(class, perc_24, perc_25)

# Making a ggplot graph
gso24 = ggplot(tabso2, aes(x=class, y=perc_24, fill=class, color=class)) + 
     geom_bar(stat="identity") +
     ggtitle("Percentage year 2024") +
     ylim(c(0,100))
gso25 = ggplot(tabso2, aes(x=class, y=perc_25, fill=class, color=class)) + 
     geom_bar(stat="identity") +
     ggtitle("Percentage year 2025") +
     ylim(c(0,100))

gso24+gso25

#---
# Creating collages with graphics with results and images for markdown script
# NDVI
pdf("ndviout.pdf")
im.multiframe(2,2)
plot(ndvi24, col=cividis(100))
plot(dvi25, col=cividis(100))
plot(ndvidiff, col=cividis(100))
plot(ndvi24, ndvi25, xlim=c(-0.3,0.9), ylim=c(-0.3, 0.9), ylab="June 2025", xlab="August 2024")
abline(0, 1, col="#6600ff", lwd=2)
dev.off()

# Sulfur dioxide classification
png("class_24.png", width=700, height=400)  # with "width" and "height", the image can be resized
plot(so2d24cs)
dev.off()
png("class_25.png", width=700, height=400)
plot(so2d25cs)
dev.off()
png("graphs_so2.png",width=1000, height=700)
gso24+gso25
dev.off()

#---
# Function that assigns an image to a variable, flips it and plots it, to speed up the process
flot <- function(x,y){
  x = rast(y)  # creates a variable that contains the image
  x = flip(x)  # flipping image
  plot(x)
  return(x)    # outputs the rotated image
}




