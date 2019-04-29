#Markov Chain
# https://www.cs.princeton.edu/courses/archive/fall13/cos521/lecnotes/lec12.pdf
# quick definition: http://mathworld.wolfram.com/MarkovChain.html
# https://www.dartmouth.edu/~chance/teaching_aids/books_articles/probability_book/Chapter11.pdf


# set.seed(10204)

ncols <- 10^3 +1
nrows <- 10^3
S <- matrix(nrow = nrows, ncol = ncols)
# vector(mode = "numeric", length = n+1) #inital state
S[,1] <- 0
for(j in 1:nrows){

	for(i in 1:(ncols -1 )){
		S[j, i+1] <-  rnorm(1, mean = S[j, i], sd = 1)
	}
}

plot(S[1,])
plot(S[2,])
plot(S[122,])

v <- colMeans(S)
plot(v)
fit <-  loess(v ~ c(1:(length(v))), family = "gaussian", method = "loess")
lines(fit)

plot(v)
fit2 <-  loess(v ~ c(1:(length(v))), family = "symmetric", method = "loess")
lines(fit2)
