###################################################
## Aim: Function which generates samples from AR(1) 
## Also: Calculating ESS for data from AR(1)
###################################################

set.seed(10)
library(mcmcse)

#Generate AR(1)Output
AR1 <- function(n, rho, tau)  {
  X <- numeric(length = n)
  Y <- rnorm(n, mean = 0, sd = tau)
  X[1] = 0
  
  for(i in 2:n) { 
    X[i] = rho*X[i-1] + Y[i]
  }
  
  return(X)
}

#Initial settings
n <- 1e3
rho <- 0.9
tau <- 2

#Sample data
X <- AR1(n, rho, tau)

#Estimate ESS
ess(X)