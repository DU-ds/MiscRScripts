# https://www.hackerrank.com/challenges/s10-geometric-distribution-1/problem
# The probability that a machine produces a defective product is 1/3 . What is the probability that the 1st defect is found during the 5th inspection?
library(magrittr)
n <- 10000000
pr <- 1/3
testval <- 5

trials <- rnbinom(n = n, prob = pr, size = 1) + 1 
fifth <- ifelse(trials <= testval, 1, 0)
geotrials <- rgeom(n = n, prob = pr) + 1
fifthgeo <- (geotrials <= testval) %>% ifelse(1,0)
ans <- sum(fifth)/n
ansgeo <- sum(fifthgeo)/n
round(ansgeo, digits = 3) %>% cat
cat(sprintf("%.3f\n", ans))



#analytical solution:
sum = 0
for(i in 0:(testval-1)){
	sum <- sum + (1-pr)^i * pr
}
cat(sprintf("%.3f\n", sum))
cat(round(sum, digits = 3))
#(1-pr)^4 * pr + (1-pr)^3 *pr