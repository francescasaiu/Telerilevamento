# Exam project title: Title
## Data gathering

Data were gathered from the [Earth observatory site](https://earthobservatory.nasa.gov/).

Packages used:
```r
library(terra)
library(imageRy)
```
Setting the working directory and importing the data:
```r
setwd("C:\Users\fsaiu\OneDrive\Immagini\incendi.jpg")
fires = rast("incendi.jpg")
plot(fires)
fires = flip(fires)
plot(fires)
```
The image is the following:

## Data analysis

Based on the gathering from the site we can calculate an index, using the fist two bands:
```r
firei = fires[[1]] - fires[[2]]
plot(firei)
dev.off()
```
The index looks like:


## Index visualisation by viridis

In order to visualise the index with another viridis palette we made use of the following code:
```r
library(viridis)
plot(firei, col=inferno(100))
png("inferno.png")
plot(firei, col=inferno(100))
```
The output will look like:















