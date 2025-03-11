# Code to calculate spectral indices from satellite images
library(terra)
library(imageRy)
library(viridis)

mato92=im.import("matogrosso_l5_1992219_lrg.jpg")
mato92=flip(mato92) # giro l'immagine
# 1=NIR
# 2=red
# 3=green
im.plotRGB(mato92, r=1, g=2, b=3)
im.plotRGB(mato92, r=2, g=1, b=3)
im.plotRGB(mato92, r=2, g=3, b=1)

# Import the 2006 image of the Mato Grosso area
