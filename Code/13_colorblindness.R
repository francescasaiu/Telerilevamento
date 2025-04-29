# Code to solve colorblindness problems

# Packages
library(terra)
# Installind cblindplot
library(devtools)
install_github("ducciorocchini/cblindplot")
library(cblindplot)

# Importing data
setwd("C:/Users/fsaiu/UNI/MAGISTRALE/TELERILEVAMENTO")
vinicunca=rast("vinicunca.jpg")
vinicunca=flip(vinicunca)
plot(vinicunca)

im.multiframe(1,2)
im.plotRGB(vinicunca, r=1, g=2, b=3, title="Standard Vision")
im.plotRGB(vinicunca, r=2, g=1, b=3, title="Protanopia")

# Solving colorblindness
dev.off()
rainbow= rast("rainbow.jpg")
plot(rainbow)
rainbow=flip(rainbow)
plot(rainbow)
cblind.plot()
