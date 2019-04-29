#Markov Chain
# https://www.cs.princeton.edu/courses/archive/fall13/cos521/lecnotes/lec12.pdf
# quick definition: http://mathworld.wolfram.com/MarkovChain.html
# https://www.dartmouth.edu/~chance/teaching_aids/books_articles/probability_book/Chapter11.pdf


# set.seed(10204)

n <- 10^5
S <- vector(mode = "numeric", length = n+1) #inital state
S[1] <- 0

for(i in 1:n){
	S[i+1] <-  rnorm(1, mean = S[i], sd = 1)
}

plot(S)
