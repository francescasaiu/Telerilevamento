# R code performing multitemporal analysis
install.packages("ggridges")
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

# Ridgeline plots, per qualsiasi tipo di dataset
# Serve pacchetto ggridges
im.ridgeline(gr, scale=1)
im.ridgeline(gr, scale=2)
im.ridgeline(gr, scale=2, palette="inferno")

# Importing the data fron Sentinel
ndvi=im.import("Sentinel2_NDVI")
im.ridgeline(ndvi,scale=2)
# Changing names
names(ndvi)=c("02_Feb","05_May","08_Aug","11_Nov")
# Names
#Sentinel2_NDVI_2020-02-21.tif  
#Sentinel2_NDVI_2020-05-21.tif  
#Sentinel2_NDVI_2020-08-01.tif  
#Sentinel2_NDVI_2020-11-27.tif 

plot(ndvi[[1]],ndvi[[2]])
# y=x, may=y feb=x
# y=a+bx, a=0 e b=1 ,se x=y
abline(0,1,col="purple")
plot(ndvi[[1]],ndvi[[2]],xlim=c(-0.3,0.9),ylim=c(-0.3,0.9))
# i dati di maggio sono sempre sopra abline se fossero uguali si dovrebbero distribuire lungo la linea
im.multiframe(1,3)
plot(ndvi[[1]])
plot(ndvi[[2]])
plot(ndvi[[1]],ndvi[[2]],xlim=c(-0.3,0.9),ylim=c(-0.3,0.9))
abline(0,1,col="purple")



