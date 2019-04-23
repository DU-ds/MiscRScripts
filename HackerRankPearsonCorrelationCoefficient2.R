# https://www.hackerrank.com/challenges/s10-spearman-rank-correlation-coefficient/problem?h_r=next-challenge&h_v=zen
#actaully spearman -- not pearson 
?cor
library("magrittr")

f <- file("stdin")
a <- scan(f)
n <- a[1]
a1 <- a[-1]
x <- a1[1:n]
y <- a1[-c(1:n)]

xrank <- x %>% as.factor %>% as.numeric
yrank <- y %>% as.factor %>% as.numeric

d <- xrank - yrank
d2 <- d*d

ans  <- 1- ((6 * sum(d2)) / (n*(n^2 - 1)))
ans1 <- cor(x=xrank,y=yrank)
ans2 <- cor(x=x,y=y, method = "spearman")

ans %>% round(digits=3) %>% cat()