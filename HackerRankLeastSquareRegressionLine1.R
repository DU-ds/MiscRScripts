# https://www.hackerrank.com/challenges/s10-least-square-regression-line/problem
library(magrittr)

apttest <- c(95, 85, 80, 70, 60)
statgrade <- c(85, 95, 70, 65, 70)
testScore <- 80

n <- apttest %>% length
onevector <- c(rep(1, n))
mat <- cbind(onevector, apttest)

linearModel <- function(v, y){
	m <- solve(t(v) %*% v ) %*% t(v) %*% y
	return(as.vector(m))
}

fm1 <- linearModel(mat, statgrade)

constant <- fm1[1]
slope1 <- fm1[2]

ans <- constant + (testScore * slope1)
ans %>% round(digits = 3) %>% cat