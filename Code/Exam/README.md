# Analysis of Mt. Etna's eruption
This presentation is based on Sicily's Mt. Etna's eruption, began on October 27 of the year 2002. It did not stop erupting until January 29, three months later. Here will be represented the evolution of the eruptive plum and the emission of sulfur dioxide.
## Data gathering
All data are gathered from [Earth Observatory site](https://earthobservatory.nasa.gov/) and [Google Earth](https://earth.google.it).

Used packages:

``` r
library(terra)
library(imageRy)
library(viridis)
```
Creating a function for plotting and flipping the images at the same time:

```r
flot <- function(x) {
  x=flip(x)
  plot(x)
}
```
Setting the working directory and importing data:

``` r
setwd("C:/Users/fsaiu/UNI/MAGISTRALE/TELERILEVAMENTO")
gview = rast("Italy.jpg")
flot(gview)
```
This image show Italy in a typical setting, without eruptions:

<img src = "../Pics/Italy.jpg"/>
