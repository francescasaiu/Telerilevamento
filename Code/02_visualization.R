# R code for visualization satllite data
library(terra)
library(imageRy)
im.list()
# for the whole course we will use "0" instead of "<-" beacause we do not care :)
b2=im.import("sentinel.dolomites.b2.tif")
cl=colorRampPalette(c("black","dark grey","light grey"))(100)  # 100 gamme di colori diversi tra un colore e l'altro
plot(b2,col=cl)
# search "r colors" on internet, gives me all the names of the possible colors in R

cl=colorRampPalette(c("green","purple","plum1"))(100)
plot(b2,col=cl)
