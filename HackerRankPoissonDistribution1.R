# https://www.hackerrank.com/challenges/s10-poisson-distribution-1/problem
# Poisson Distribution 1

Poisson_k_lambda <- function(k, lambda){
	return(((lambda^k) * exp(-1 * lambda))/factorial(k))
}

lambda <- 2.5
k <- 5

answer <- Poisson_k_lambda(k, lambda)

cat(sprintf("%.3f", answer))
