#R Course Spring 2016
#Module 11 - Debugging

#Debug the code

tukey_multiple <- function(x) { 
  outliers <- array(TRUE,dim=dim(x)) 
  for (j in 1:ncol(x)) 
  { 
    outliers[,j] <- outliers[,j] && tukey.outlier(x[,j]) 
  } 
  outlier.vec <- vector(length=nrow(x)) 
  for (i in 1:nrow(x)) 
  { outlier.vec[i] <- all(outliers[i,]) } 
  return(outlier.vec) }

x <- rnorm(1000, 1, 0.5)
xmat <- matrix(x, nrow = 200, ncol = 5)

library(outliers)
t <- tukey_multiple(xmat)

debug(tukey_multiple)
