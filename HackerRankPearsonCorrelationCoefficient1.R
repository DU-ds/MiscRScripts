# https://www.hackerrank.com/challenges/s10-pearson-correlation-coefficient/problem
# ?read.table
# ?scan
# ?connections # ?file


f <- file("stdin")
#lst <- read.table(f, sep = " ", skip = 1)
# lst <- scan(f, skip = 1)
# close(f) #shouldnt be needed but...
# mat <- as.matrix(lst)
# x <- mat[1,]
# y <- mat[2,]

# a <- scan(f, skip = 1)
a <- scan(f)
n <- a[1]
a1 <- a[-1]
x <- a1[1:n]
y <- a1[-c(1:n)]


xbar <- sum(x)/length(x)
ybar <- sum(y)/ length(y)

x0 <- x - xbar
y0 <- y - ybar

10
10 9.8 8 7.8 7.7 7 6 5 4 2
200 44 32 24 22 17 15 12 8 4


#cauchy-swartz
# https://en.wikipedia.org/wiki/Cauchy%E2%80%93Schwarz_inequality

# Thirteen Ways to Look at the Correlation Coefficient
# Joseph Lee Rodgers; W. Alan Nicewander
# The American Statistician, Vol. 42, No. 1. (Feb., 1988), pp. 59-66.

# Geometric interpretation of a correlation
# Zenon Gniazdowski
# Zeszyty Naukowe Warszawskiej Wyższej Szkoły Informatyki Nr 9, Rok 7, 2013, s. 27-35


xdoty <- x0 %*% y0
eucnormx <- sqrt( x0 %*% x0)
eucnormy <- sqrt(y0 %*% y0 )
rho <- xdoty / ( eucnormy * eucnormx)


cat(round(rho, 3))