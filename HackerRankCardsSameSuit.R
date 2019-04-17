# 52 -> 51 (1/4) 
# 52 -> 51 (1/4)
# 52 -> 51 (1/4)
# 52 -> 51 (1/4)

# 51 - 50 1/4
# 52 - 51 1/4
# 52 -
# 52

# 52
# 51
# 52
# 52

# 52
# 52
# 51
# 52

# 52
# 52
# 52
# 51

# https://www.hackerrank.com/challenges/s10-mcq-5/problem

library(magrittr)

# decks <- c(1,2,3,4)
cards <- c(1:52)
decks2 <- c(rep(1,13), rep(2,13), rep(3,13), rep(4, 13))
draw1  <- function(){
 	card1 <- ceiling(runif(1, min = 0, max = length(decks2)))
 	return(card1)
 }
card1 <- 0
card2 <- 0
draw2 <- function(){
	
	card2 <- ceiling(runif(1, min = 0, max = length(decks2)))
	if(card1 == card2)
	{
		draw2()
	} 
	else {
		return(card2)
	}
}

draw <- function(){
	card1 <- draw1()
	card2 <- draw2()
	# cat("card 1: ", card1, "card 2: ", card2, "\n")
	c(card1, card2) %>% return
}

n <- 100000
yes <- 0 #number of cards matching condition (i.e. cards are of same suit)
for(i in 1:n){
	pair <- draw()
	card1 <- pair[1]
	card2 <- pair[2]
	deckNumOfCards <- c(decks2[card1], decks2[card2])
	if(deckNumOfCards[1] == deckNumOfCards[2])
	{
		yes <- (yes + 1)
	}
}

cat("number of trials: ", n, "\nnumber of matching suits: ", yes, "\nmatches per trial: ", (yes/n), "\n" )