# Analysis of Mt. Etna's eruption
This presentation is based on the latest Sicily's Mt. Etna's eruptions; it will show, especially, the differences recorded during two eruptions happened within a year of each other, in August 2024 and June 2025. Some of the parameters that will be analysed are the NDVI (Normal Difference Vegetation Index) and the difference of sulfur dioxide emission.
## Data gathering
All data are gathered from [Google Earth](https://earth.google.it), [Earth Observatory site](https://earthobservatory.nasa.gov/) and [Copernicus Data Space Ecosystem site](https://dataspace.copernicus.eu/explore-data/data-collections/sentinel-data/sentinel-2).

Used packages:

``` r
library(terra)   # for spatial data analysis
library(imageRy) # to analyze raster images with R
library(viridis) # useful for changing color ramp palette
```
Creating a function for plotting and flipping the images at the same time:

```r
flot <- function(x,y){
  x = rast(y)  # creates a variable that contains the image
  x = flip(x)  # flipping image
  plot(x)
  return(x)    # outputs the rotated image
}
```
Setting the working directory and importing data:

``` r
setwd("C:/Users/fsaiu/UNI/MAGISTRALE/TELERILEVAMENTO")
gview = flot(gview, "Italy.jpg")
```
This image shows Italy in a typical setting, without eruptions:

<img src = "../../Pics/Italy.jpg"/>

>The other images are downloaded with the same procedure as this one.

During the eruptions Mt. Etna looks like theese two images in true colors:

<img src = "../../Pics/Mount_Etna_plumes.jpg" width = 50%/><img src = "../../Pics/Mount_Etna_erupts.jpg" width = 50%/>


<img src = "../../Pics/class_24.png"/>



