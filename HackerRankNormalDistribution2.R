# https://www.hackerrank.com/challenges/s10-normal-distribution-1/problem
library(magrittr)
mu = 70
sd = 10

q1 <- 80 #greater than 80 so 1- ans

q2 <- 60 #greater than 60 so 1- and
q3 <- 60 #less than

over80 <-  pnorm(q1, mean = mu, sd = sd, lower.tail = FALSE)  * 100 # percent instead of decimal
under60 <- pnorm(q2, mean = mu, sd = sd) * 100 # percent instead of decimal
over60 <-  pnorm(q2, mean = mu, sd = sd, lower.tail = FALSE) * 100 # percent instead of decimal

ans1 <- over80  %>% round(digits = 2)
ans2 <- over60  %>% round(digits = 2)
ans3 <- under60 %>% round(digits = 2)

ans1 %>% cat("\n")
ans2 %>% cat("\n")
ans3 %>% cat()


over80 <- 1 - pnorm(q1, mean = mu, sd = sd)
over60 <- 1-pnorm(q2, mean = mu, sd = sd)
under60 <- pnorm(q2, mean = mu, sd = sd)