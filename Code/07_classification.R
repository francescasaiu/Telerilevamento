# R code for classifying images
# install.packages("patchwork")

library(terra)
library(imageRy)
library(ggplot2)
library(patchwork)

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

# creating a dataframe
class = c("Forest","Antropic")
y1992=c(83,17)
y2006=c(45,55)
tab=data.frame(class, y1992,y2006)

p1=ggplot(tab, aes(x=class, y=y1992, color=class)) + 
  geom_bar(stat="identity", fill="white") +
ylim(c(0,100))

p2=ggplot(tab, aes(x=class, y=y2006, color=class)) + 
  geom_bar(stat="identity", fill="white") +
ylim(c(0,100))
# uso patchwork per mettere i due grafici vicini
p1+p2
# per averli uno sopra l'altro
p1/p2

p0= im.ggplot(mato92)
p00= im.ggplot(mato06)
p0+p00+p1+p2


