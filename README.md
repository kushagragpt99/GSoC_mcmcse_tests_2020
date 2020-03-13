# GSoC_mcmcse_tests_2020
Tests for the GSoC project 'mcmcse: updates, cleanup, and efficiency', under R stats

## Test 1
Easy: (1) Download the mcmcse package from CRAN and use the function `ess` on a vector `foo` of length 1e4 randomly drawn from a standard normal distribution.   
(2) Make a random matrix of size 10 x 10 and produce _only_ the eigenvalues of the matrix.

## Test 2
- Medium: Write a function that runs a Gaussian AR(1) model and use `mcmcse` to estimate the effective sample size.

## Test 3
- Hard: Implement the replicated batch means estimator from [this](https://onlinelibrary.wiley.com/doi/pdf/10.1002/nav.20158) paper.
