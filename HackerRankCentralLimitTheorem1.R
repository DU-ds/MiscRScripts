# https://www.hackerrank.com/challenges/s10-the-central-limit-theorem-1/problem

# reading:
# https://www.hackerrank.com/challenges/s10-the-central-limit-theorem-1/tutorial
# https://stackoverflow.com/questions/37150537/simulate-5000-samples-of-size-5-from-a-normal-distribution-with-mean-5-and-stand
# http://personality-project.org/r/distributions.html
# https://stackoverflow.com/questions/51774646/efficiency-of-matrix-rowsums-vs-colsums-in-r-vs-rcpp-vs-armadillo#51776424
?lapply
?rnorm

library("magrittr")

maxWeight <- 9800
numBoxes <- 49
mu <- 205
sd <- 15
n <- 10^5

sampMat <- matrix(rnorm(numBoxes * n, mean = mu * numBoxes, sd = sd * sqrt(numBoxes)), numBoxes, n)
sampMat <- ifelse(sampMat > maxWeight, 0, 1)
sampMat %>% colSums-> v
v2 <- v/numBoxes

sum(v)/numBoxes -> ans
sum(v2)/n -> ans2
cat (round (ans2,4))