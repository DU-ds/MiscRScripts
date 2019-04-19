library("magrittr")
a <- 0.88
b <- 1.55

costA <- function(lambda){
	return(160 + (40 * (lambda + lambda^2)))
}

costB <- function(lambda){
	return(128 + (40 * (lambda + lambda^2)))
}

ansa <- costA(a) #226.176
ansb <- costB(b) #286.1
cat(sprintf("%.3f\n", ansa))
cat(sprintf("%.3f\n", ansb))

cat(round(ansa,3),'\n')
cat(round(ansb,3))

#simulation:
n <- 10^8
asim <- rpois(n = n, lambda = a)  
bsim <- rpois(n = n, lambda = b)

amax <- asim %>% max
bmax <- bsim %>% max



calc <- function(v, max){
	zeroToN = c()
	for(i in 0:max)
	{
		bool <- ifelse(v == i, 1, 0)
		proportionI <- sum(bool)/n
		zeroToN = c(zeroToN, proportionI) 
	}
	return(zeroToN)
}

costa <- function(X){
	return(160 + (40 * X^2))
}
costb <- function(Y){
	return(128 + (40 * Y^2))
}

#apply cost functions to random variables x and y

acost <- sapply(X = asim, FUN = costa)
bcost <- sapply(X = bsim, FUN = costb) 

sum(acost)/n
sum(bcost)/n

aans <- acost %>% sum()/n
bans <- bcost %>% sum()/n
cat(aans, "\n")
cat(bans)
