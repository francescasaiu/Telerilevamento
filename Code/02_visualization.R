# R code for visualization satellite data
# install viridis for the colors
install.packages("viridis")

library(terra)
library(imageRy)
library(viridis)

im.list() # mi da la lista di tutti i dati che sono stati caricati
# for the whole course we will use "=" instead of "<-" because we do not care :)
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

#viridis, sostituisce colorRampPalette
plot(sentdol,col=viridis(100))
plot(sentdol,col=mako(100))
plot(sentdol,col=cividis(100))
nlyr(sentdol)
ncell(sentdol)
ncell(sentdol)*nlyr(sentdol)

#LAYERS
# 1=blue b2
# 2=green b3
# 3=red b4
# 4=NIR b8

im.plotRGB(sentdol, r=3, g=2, b=1)   # immagine a "colori naturali" ho assegnato ad un colore RGB la banda giusta
im.plotRGB(sentdol, r=4, g=3, b=2) # immagine a "colori falsi/falsati", tutte le piante diventeranno rosse perchè riflettono tanto nel NIR che abbiamo messo nel rosso (layer 4)
im.plotRGB(sentdol, r=3, g=4, b=2)
im.multiframe(1,2)
im.plotRGB(sentdol, r=4, g=3, b=2)
im.plotRGB(sentdol, r=3, g=4, b=2)


