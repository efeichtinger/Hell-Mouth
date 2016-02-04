#Module 4
#February 2016
#Write my own function

#cool example from the blog of Hillary Parker
cat_function <- function(love=TRUE){
  if(love==TRUE){
    print("I love cats!")
  }
  else {
    print("I am not a cool person.")
  }
}
cat_function(TRUE)
Cat_function(FALSE)


#a function I wrote a couple of years ago for a simulation of plant growth
#a = a constant, can vary later for environ stochasticity
#b = an allometric constant, growth parameter
#e = a scaling exponent
#x = size (mass) at time t
powerlaw <- function(b, x, a, c){
  g <- (b*x)^a + c
  return(g)
}
a1 <- 0.8
c1 <- 1
init.n <- 100
x.start <- rnorm(init.n, 0.6, 0.01)
b.start <- rnorm(init.n, 1, 0.5)
#calculate absolute growth rate 
agr <- powerlaw(b.start,x.start,a1, c1)
#fix
agr.mat <- as.matrix(agr, nrow = 10, ncol= 10, byrow=TRUE)


#fecundity function
fecundity <- function(a, b, x){
  f <- a + b*x
  return(f)
}

#simple function
squares <- function(a,b){
  s <- a^2 + b^2
  return(s)
}

x <- c(1:10)
y <- c(11:20)

squares(x,y)

#convert interval from days to years
years <- function(a){
  y <- a/365.25
  return(y)
}
#

jay.surv <- years(x)

#average number of years lived
mean(years)
