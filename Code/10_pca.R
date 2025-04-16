# R code for Principal Component Analysis

library(imageRy)
library(terra)

im.list()

sent = im.import("sentinel.png")
sent = flip(sent)
plot(sent)
# ho 4 bande ma una è solo gialla, faccio uno stack
sent = c(sent[[1]],sent[[2]],sent[[3]])

# NIR = band 1
# red = band 2
# green = band 3

sentpca = im.pca(sent)

# somma 3 valori assi (PC1,PC2,PC3), sono sempre un po' diversi
tot = 72 + 59 + 6
# 137

sentpca = im.pca(sent, n_samples=100000)


# 72 : 137 = x : 100

72 * 100 / tot
#  come sd ma qui scelgo variabile matematicamente e non soggettivamente
sdpc1 = focal(sentpca[[1]], w=c(3,3), fun="sd")
plot(sdpc1)    












