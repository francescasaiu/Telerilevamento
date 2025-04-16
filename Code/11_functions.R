# Code for building new functions

somma <- function(x,y) {
  z=x+y
  return(z)
}

mf <- function(nrow,ncol) {
  par(mfrow=c(nrow,ncol))
}

positivo <- function(numero) {
  if(numero>0) {
    print("Questo numero è positivo")
  }
  else if(numero<0) {
    print("Questo numero è negativo")
  }
  else {
    print("Lo zero non è né positivo, né negativo")
  }
}

flot <- function(x) {
  x=flip(x)
  plot(x)
}
