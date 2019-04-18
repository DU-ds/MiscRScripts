# https://www.hackerrank.com/challenges/s10-binomial-distribution-1/problem
input <- c(1.09, 1)
one <- input[1]
two <- input[2]
numChildren <- 6
numTrials <- 100000
pr <- two/(two+one)

trials <- rbinom(numTrials, numChildren, pr)
threeormore <- ifelse(trials <= 3, 1, 0)
ans <- sum(threeormore) / numTrials
cat(sprintf("%.3f", ans))


