# https://www.hackerrank.com/challenges/s10-normal-distribution-1/problem
library(magrittr)
mu = 70
sd = 10

q1 <- 80 #greater than 80 so 1- ans

q2 <- 60 #greater than 60 so 1- and
# q3  less than 60

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





# simulation:
n <- 10^8
sim <- rnorm(n = n, mean = mu, sd = sd)

greaterthan80 <- ifelse(sim >  q1, 1, 0)
passed        <- ifelse(sim >= q2, 1, 0)
failed        <- ifelse(sim <  q2, 1, 0)

prop80   <- 100* sum(greaterthan80)/n #%>% round(digits = 2)
proppass <- 100* sum(passed) / n      #%>% round(digits = 2)
propfail <- 100* sum(failed) / n      #%>% round(digits = 2)
#cat("pr(>80): " , prop80, "\npr(passed): ", proppass, "\npr(failed): ", propfail)

prop80   <- prop80   %>% round(digits = 2)
propfail <- propfail %>% round(digits = 2)
proppass <- proppass %>% round(digits = 2)

prop80   %>% cat("\n")
proppass %>% cat("\n")
propfail %>% cat()    