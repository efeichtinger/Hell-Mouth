##Assignment #4
##Write my own function

#Powerlaw - function for absolute growth rate in plants
#c is a constant
#a is a scaling exponent 
#x is mass
#b is a growth parameter

powerlaw <- function(b, x, a, c){
  g <- (b*x)^a + c
  return(g)
}

#Simulated population
#x.start is the distribution of starting sizes
#b.start is the distribution of the growth parameter at starting time
#a,c both constants 
a1 <- 0.8
c1 <- 1
init.n <- 100
x.start <- rnorm(init.n, 0.6, 0.01)
b.start <- abs(rnorm(init.n, 1, 0.5))

#Absolute growth rate after one time step from powerlaw function
agr <- powerlaw(b.start, x.start, a1, c1)
mean(agr)
sd(agr)
range(agr)

#Just for fun, here is a bonus function
#simple function
squares <- function(a,b){
  s <- a^2 + b^2
  return(s)
}

x <- c(1:10)
y <- c(11:20)

squares(x,y)


