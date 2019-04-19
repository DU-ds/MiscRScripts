# https://www.hackerrank.com/challenges/s10-normal-distribution-1/problem
library("magrittr")
xbar <- 20
stdx <- 2

q1 <- 19.5
q2lower <- 20
q2upper <- 22


a1 <- pnorm(q1, mean = xbar, sd = stdx)
hour20 <- pnorm(q2lower, mean = xbar, sd = stdx)
hour22 <- pnorm(q2upper, mean = xbar, sd = stdx)
a2 <- hour22 - hour20

hour18 <- pnorm(18, mean = xbar, sd = stdx)

sixeight <- hour22 - hour18 #should be about 68% since it's mean +- 1 sd
round(a1, digits = 3) %>% cat("\n")
round(a2, digits = 3) %>% cat()