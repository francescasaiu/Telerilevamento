# R code performing multitemporal analysis
library(imageRy)
library(terra)
library(viridis)

im.list()
EN_01=im.import("EN_01.png")
EN_01=flip(EN_01)
plot(EN_01)
EN_13=im.import("EN_13.png")
EN_13=flip(EN_13)
plot(EN_13)

# plot two images one beside the other
im.multiframe(1,2)
plot(EN_01)
plot(EN_13)

# differenza  della concentrazione di azoto tra le due immagini
ENdiff=EN_01[[1]]-EN_13[[1]]
plot(ENdiff)
plot(ENdiff, col=inferno(100))

# Greenland ice melt
gr=im.import("greenland")
im.multiframe(1,2)
plot(gr[[1]], col=rocket(100))
plot(gr[[4]], col=rocket(100))
grdiff=gr[[1]]-gr[[4]]
plot(grdiff)
