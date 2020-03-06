#install.packages('mcmcse', repos='http://cran.us.r-project.org')
################################################
## Aim: Calculating ESS for a random sample
## Also: Calculate only eigen values of a matrix
################################################
set.seed(10)
library(mcmcse)

#Sampling 1e4 samples from N(0,1) & using ess function
foo <- rnorm(1e4)
ess(foo)

#Sampling a random matrix and calculating eigen values
rmatrix <- matrix(rnorm(100), ncol = 10)
eigen(rmatrix, only.values = TRUE)$values
