################################################
## Aim: Implementing the RBM paper
## Also: Estimating variance of AR(1) using RBM
################################################

set.seed(10)
library(mcmcse)

#Function for generating AR(1) output
AR1 <- function(n, rho, tau)  {
  X <- numeric(length = n)
  Y <- rnorm(n, mean = 0, sd = tau)
  X[1] = 0
  
  for(i in 2:n) { 
    X[i] = rho*X[i-1] + Y[i]
  }
  
  return(X)
}

#Returns batches(Y) by making batches of X
get_batch <- function(X, n, a, b) {
  Z <- numeric(length = a)  
  
  for(i in a:1) {
    Z[i]=mean(X[ (b*(i-1)+1) : (b*i)])
  }
  
  return(Z)
}

#Implementation of RBM
RBM <- function(Y, m, n, a, b)  {
  overall_mean <- mean(Y)
  Z <- sum( (Y - overall_mean)^2 )*(b/( (m*a) - 1) )
  return(Z)
}

#Initial settings
rho <- 0.9
tau <- 1
m <- 5
n <- 1e3
a <- floor(sqrt(n))
b <- a
X <- matrix(nrow = m, ncol = n)
Y <- matrix(nrow = m, ncol = a)

#Sampling m replications from AR(1)
for( i in 1:m)  {
    X[i,] <- AR1(n, rho, tau)
    Y[i,] <- get_batch(X[i,], n, a, b)
}

#Estimation of RBM
RBM(Y, m, n, a, b)