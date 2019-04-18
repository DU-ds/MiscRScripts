# https://www.hackerrank.com/challenges/s10-binomial-distribution-1/problem
input <- c(1.09, 1)
one <- input[1]
two <- input[2]
numChildren <- 6
numTrials <- 1000000
pr <- two/(two+one)

trials <- rbinom(numTrials, numChildren, pr)
threeormore <- ifelse(trials <= 3, 1, 0)
ans <- sum(threeormore) / numTrials
cat(sprintf("%.3f", ans))



pr1 <- one/(two + one)
trials1 <-  rbinom(numTrials, numChildren, pr1)
threeormore <- ifelse(trials1 <= 3, 1, 0)
ans1 <- sum(threeormore) / numTrials
cat(sprintf("%.3f", ans))

threeormore <- ifelse(trials1 == 3, 1, 0)
ans3 <- sum(threeormore) / numTrials
cat(sprintf("%.3f", ans))

cat(sprintf("%.3f", (ans + ans1 - ans3))) 
#1.000