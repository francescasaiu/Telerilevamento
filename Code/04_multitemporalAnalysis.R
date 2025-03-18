# R code performing multitemporal analysis
library(imageRy)
library(terra)

im.list()
EN_01=im.import("EN_01.png")
EN_01=flip(EN_01)
plot(EN_01)
EN_13=im.import("EN_13.png")
EN_13=flip(EN_13)
plot(EN_13)

# plot two images one beside the other


