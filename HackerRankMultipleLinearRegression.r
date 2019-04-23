# https://www.hackerrank.com/challenges/s10-multiple-linear-regression/problem

library(magrittr)

f <- file("R:/R_WD/GitHub/MiscRScripts/input/input00.txt")
input <- scan(f)
m <- input[1]
input <- input[-1]
n <- input[1]
input <- input[-1]
y <- c()
toRemove <- c()
for(i in 1:n){
	index <- i*(m + 1)
	y <- c(y, input[index])
	toRemove <- c(toRemove, index)
}
input <- input[-toRemove]

x <- input[1:(m*n)] %>% matrix(ncol = m, byrow = T)
x2 <- input[-c(1:(m*n))]
q <- x2[1]
x2 <- x2[-1]
x2 <- x2 %>% matrix(ncol = m, byrow = T) 
X <- cbind(c(rep(1,dim(x)[1])), x)
X2 <- cbind(c(rep(1,dim(x2)[1])), x2)

fm1 <- solve(t(X) %*% X) %*% t(X) %*% y
ans <- X2 %*% fm1

ans <- ans %>% round(digits= 2) 

for(i in seq_along(ans)){
	cat(ans[i], "\n")
}