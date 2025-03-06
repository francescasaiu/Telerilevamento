# R code for visualization satllite data

library(terra)
library(imageRy)


im.list() # mi da la lista di tutti i dati che sono stati caricati
# for the whole course we will use "0" instead of "<-" beacause we do not care :)
# band 2 blue
b2=im.import("sentinel.dolomites.b2.tif")

cl=colorRampPalette(c("black","dark grey","light grey"))(100)  # 100 gamme di colori diversi tra un colore e l'altro
plot(b2,col=cl)
# search "r colors" on internet, gives me all the names of the possible colors in R
cl=colorRampPalette(c("green","purple","plum1"))(100)
plot(b2,col=cl)

# band 3 green
b3=im.import("sentinel.dolomites.b3.tif")
# band 4 red
b4=im.import("sentinel.dolomites.b4.tif")
# band 8 near infrared
b8=im.import("sentinel.dolomites.b8.tif")

par(mfrow=c(1,4))
plot(b2)
plot(b3)
plot(b4)
plot(b8)
dev.off() #quando ho problemi grafici, mi esplode R
im.multiframe(1,4)
plot(b2)
plot(b3)
plot(b4)
plot(b8)

# plot the bands one on top of the others
im.multiframe(2,2)
plot(b2)
plot(b3)
plot(b4)
plot(b8)
cl=colorRampPalette(c("black","dark grey","light grey"))(100)
plot(b2,col=cl)
plot(b3,col=cl)
plot(b4,col=cl)
plot(b8,col=cl)

# stack per creare pacchetto di dati così ho i nomi delle immagini
sent=c(b2,b3,b4,b8)
plot(sent,col=cl)
names(sent)=c("b2.blue","b3.green","b4.red","b8.NIR")

plot(sent$b8.NIR)
plot(sent[[4]])
# how to import several sets altogether
sentdol=im.import("sentinel.dolomites") # uso parte comune e li chiamo tutti
pairs(sentdol)





