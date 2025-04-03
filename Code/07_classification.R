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

#--- Solar orbiter
im.list()
solar=im.import( "Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")
solarc=im.classify(solar, num_clusters=3)
dev.off()

# p0= im.ggplot(solar)
# p1= im.ggplot(solarc)
# p0+p1

im.multiframe(1,2)
plot(solar)
plot(solarc)
dev.off()

# 1 = low
# 2 = high
# 3 = medium
# In terra uso funzione subst() sostituzione nomi 1,2,3

solarcs=subst(solarc, c(1,3,2), c("01_low","02_medium","03_high"))
plot(solarcs)

perc=freq(solarcs)$count*100/ncell(solarcs)
# [1] 37.92693 41.04342 21.02965

# create dataframe
class=c("01_low","02_medium","03_high")
percs=c(38,41,21)
tabsol=data.frame(class, percs)
# final ggplot

p1=ggplot(tabsol, aes(x=class, y=percs, fill=class, color=class)) + 
  geom_bar(stat="identity") +
  # ylim(c(0,100))
  coord_flip()


