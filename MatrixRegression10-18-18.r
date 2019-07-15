set.seed(12)
x <- matrix(c(rep(1, 1000),rnorm(10000, mean = 10, sd = 1 )), ncol = 11)
y <- rnorm(1000, mean = 15, sd = 1 )

n <- 1000
x1 <- c(1:n)
x2 <- x1 + rnorm(n, mean = 0, sd = 10)
x3 <- x1 + rnorm(n, mean = 100, sd = 10)
X <- matrix(c(x1,x2,x3), ncol = 3)
y <- c(1:n) * 10
y <- y + runif(n, min = -5, max = 5)
X <- matrix(c(rep(1, n),X), ncol = 4)
betaHat <- solve(t(X)%*%X) %*% t(X)  %*% y
print(betaHat)
fm1 <- lm(y ~ X[,-1]) #b/c the first column is all 1's
summary(fm1)
summary(X)
write.table(X, file = "R:/DataSets/Matrix-10-18-18.csv", sep = ",", col.names = FALSE, row.names = FALSE )
write.table(y, file = "R:/DataSets/Vector-10-18-18.csv", sep = ",", col.names = FALSE, row.names = FALSE )
read.table(file = "R:/DataSets/Matrix-10-18-18.csv", sep = ",", header = F) -> Dat  #just to check I wrote it out right XD
read.table(file = "R:/DataSets/Vector-10-18-18.csv", sep = ",", header = F) -> Dat2


X2 <- X[,1:2]
betaHat <- solve(t(X2)%*%X2) %*% t(X2)  %*% y
e <- y - (X2 %*% betaHat)
e2 <- e^2
#s^2 estimator
s2 <- sum(e2) / (n - 2)
fm2 <- lm(y ~ 0 + X2)
#same model
fm3 <- lm(y ~ X2[,-1])


