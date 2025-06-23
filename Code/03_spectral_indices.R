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

# Import the 2006 image of Mato Grosso area with Aster satellite
mato06=im.import("matogrosso_ast_2006209_lrg.jpg")
mato06=flip(mato06)

# Metto a confronto la due immagini 1992 e 2006
im.multiframe(1,2)
im.plotRGB(mato06, r=2, g=3, b=1, title="Mato Grosso 2006")
im.plotRGB(mato92, r=2, g=3, b=1, title="Mato Grosso 1992")

plot(mato92[[1]], col=inferno(100))
plot(mato06[[1]], col=inferno(100))
# DVI
# tree: NIR=255, se sta bene; red=0; DVI= NIR-red= 255, così ho indice salute piante
# stressed tree: NIR=100; red=20; DVI= NIR-red= 100-20= 80, diretta informazione sullo stato di salute del sistema, il red di solito lo assorbe per la fotosintesi, ma se sta male ne assorbe di meno



