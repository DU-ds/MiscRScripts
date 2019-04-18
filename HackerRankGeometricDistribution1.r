# https://www.hackerrank.com/challenges/s10-geometric-distribution-1/problem
# The probability that a machine produces a defective product is 1/3 . What is the probability that the 1st defect is found during the 5th inspection?
library(magrittr)
n <- 100000
pr <- 1/3
testval <- 5

trials <- rnbinom(n = n, prob = pr, size = 1) + 1 #+1 b/c this actually gives the number of trials b4 1 success (size = 1), so +1 gives the trial number of the first sucess
geotrials <- rgeom(n = n, prob = pr) + 1 #geometric distr - special case of neg binomial dist with size = 1 (ie continues until the first success)
#size is number of sucesses b4 stopping (success has probability = 1/3)
fifth <- ifelse(trials == 5, 1, 0)#true (1) iff stopped in the fifth trial
fifthgeo <- (geotrials == 5) %>% ifelse(1,0)
ans <- sum(fifth)/n
ansgeo <- sum(fifthgeo)/n
#round(ans, digits = 3)#sprintf rounds? 
round(ansgeo, digits = 3) %>% cat
cat(sprintf("%.3f\n", ans))
#remeber "sucess" means found a failing part!


#analytical solution:
(1-pr)^4 * pr