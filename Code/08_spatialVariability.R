# Code for calculating spatial variability

library(terra)
library(imageRy)
library(viridis)
library(ggplot2)
library(patchwork)
library(RStoolbox)

# Standard deviation
23,22,23,49
m=(23+22+23+49)/4
num=(23-m)^2+(22-m)^2+(23-m)^2+(49-m)^2  # scarto quadratico
variance=num/4  #scarto quadratico medio
stdev=sqrt(variance)

#---
im.list()
sent=im.import("sentinel.png")
sent=flip(sent)
# band 1 = NIR
# band 2 = red
# band 3 = green
im.plotRGB(sent, r=1, g=2, b=3)
im.multiframe(1,3)
im.plotRGB(sent, r=1, g=2, b=3)
im.plotRGB(sent, r=3, g=1, b=2)
im.plotRGB(sent, r=2, g=3, b=1)
dev.off()

# Tiro fuori solo una banda perchè così posso fare dev std
nir=sent[[1]]
plot(nir, col=inferno(100))
sd3=focal(nir, w=c(3,3), fun=sd)
im.multiframe(1,2)
im.plotRGB(sent, r=1, g=2, b=3)
plot(sd3)
dev.off()

sd5=focal(nir, w=c(5,5), fun=sd)

p1=im.ggplot(sd3)
p2=im.ggplot(sd5)
p0=ggRGB(sent, r=1, g=2, b=3)
p0+p1+p2




