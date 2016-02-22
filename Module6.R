#Module 6

#Find the transpose of the matrix, multiplying a matrix by a vector
#inverse and determinant


A <- matrix(1:100, nrow=10, ncol=10) 
B <- matrix(1:625, nrow=50, ncol=50)
View(A)
View(B)

#Need a square matrix so I reassign B to a 50 x 50 matrix
B <- matrix(1:2500, nrow=50, ncol=50)

#Transpose of each matrix A and B
trans.A <- t(A)
trans.B <- t(B)

#Determinant of each matrix
detrA <- det(A)
detrB <- det(B)

#Inverse of each matrix
solve(A)
solve(B)
##errors

#reassign matrices by generating random numbers
A <- matrix(runif(100,1, 500), nrow = 10, ncol = 10)
B <- matrix(runif(2500, 1, 1000), nrow = 50, ncol = 50)


#Multiplication of a vector by marices A and B
a <- c(seq(1,10,1))
b <- c(seq(1,50,1))

multA <- a*A
multB <- b*B
matAa <- A%*%a
matBb <- B%*%b


#Dominant eigenvalue, return real number (usually eigenvalue of interest for biologists)
eig.A <- Re(eigen(A)[[1]][[1]])

eig.B <- Re(eigen(B)[[1]][[1]])
