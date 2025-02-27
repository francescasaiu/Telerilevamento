# First R coding from scratch
2+3
anna <- 2+3  # assignment operation to an object
chiara <- 4+6
anna+chiara
filippo <- c(0.2,0.4,0.6,0.8,0.9)  # vettore/array, funzione c=concatenate dentro parentesi ho argomenti
luca <- c(100,80,60,50,10)
plot(luca,filippo)
plot(luca,filippo, pch=19, col="blue")
plot(luca,filippo, pch=19, col="blue", cex=2 , xlab="rubbish", ylab="biomass")  # cex = character expansion
#Installing packages
#CRAN
install.packages("terra")
library(terra)
install.packages("devtools")
library("devtools")
install_github("ducciorocchini/imageRy")
library(imageRy)
