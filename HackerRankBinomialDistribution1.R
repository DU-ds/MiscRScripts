# https://www.hackerrank.com/challenges/s10-binomial-distribution-1/problem
input <- c(1.09, 1)
boy <- input[1]
girl <- input[2]
numChildren <- 6
numTrials <- 100000
# boy/girl
prboy <- boy/(girl+boy) 
prgirl <- girl/(girl+boy)
# ntrialsboy <- rbinom(numTrials, numChildren, prboy)
# threeormoreboys <- ifelse(ntrialsboy <= 3, 1, 0)
# ans <- sum(threeormoreboys) / numTrials
# http://127.0.0.1:27454/library/stats/html/Binomial.html
# cat(sprintf("%.3f", ans))


ntrialsgirls <- rbinom(numTrials, numChildren, prgirl)
threeormoregirls <- ifelse(ntrialsgirls <= 3, 1, 0)
ans <- sum(threeormoregirls) / numTrials
cat(sprintf("%.3f", ans))

