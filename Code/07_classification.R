# RF code for classifying images

library(terra)
library(imageRy)

mato92=im.import("matogrosso_l5_1992219_lrg.jpg")
mato92=flip(mato92)
plot(mato92)
mato06=im.import("matogrosso_ast_2006209_lrg.jpg")
mato06=flip(mato06)
plot(mato06)

mato92c=im.classify(mato92, num_clusters=2)
# class 1= forest
# class 2= antropic
mato06c=im.classify(mato06, num_clusters=2)
# class 1= forest
# class 2= antropic

f92= freq(mato92c)
tot92=ncell(mato92c)
prop92= f92/tot92
perc92=prop92*100
# antropic = 17%, forest = 83%

tot06=ncell(mato06c)
perc06=freq(mato06c)*100/tot06
# antropic = 54%, forest = 45%
