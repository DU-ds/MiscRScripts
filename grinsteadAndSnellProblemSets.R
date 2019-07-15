
# Chapter 1

# problem 10: martingale doubling system


simChpt1_q10_2 <- function(x){
	simChpt1_q10(winN, loseN)
}
simChpt1_q10 <- function(winVal, loseVal) {
	winnings <- 0
	bet <- 1 #inital bet
	won <- TRUE #false if lost last game 
	while(winnings > loseVal && winnings <= winVal){
		if(won){
			bet <- 1
		}
		else{
		#double bet if lose
			bet <- bet * 2
		}

		won <- winOrLose() #In R 1 is true, 0 is false
		winnings <- winnings +  payout(bet, won)

	}
	if(winnings > 0){
		bust <- 0
	}
	else{
		bust <- 1
	}
	return(bust)
}



payout <- function(bet, winOrLoseVal){


	if(winOrLoseVal){ 
		return(bet * 2) #assuming 1:1 odds
	}
	else{
		return(-1* bet) #lose money bet
	}
}

winOrLose <- function(x){
		spin <- runif(1, min=0, max = 1)
		if(spin <= .5){
			return(1)
		}
		else {

			return(0)
		}
}



winN <- 5
loseN <- -100

n <- 10^5

v <- vector(mode = "integer", length = n)

v <- sapply(v, simChpt1_q10_2)

p <- mean(v)
# same as sum(v)/length(v) so p is proportion of wins

#I got 0.01929 so less than 2% wins

# 13: 2 hospitals

boyOrGirl <- winOrLose

smallHospital <- 15
largeHospital <- 45
n <- 100000

boysBornOnDay <- function(nBorn){
	v <- vector(mode = "integer", length = nBorn)
	v <- sapply(v, boyOrGirl)
	return(sum(v))
}


simHospitalSmall <- function(x){
	boysBornOnDay(smallHospital)/ smallHospital
}

simHospitalLarge <- function(x){
	boysBornOnDay(largeHospital) / largeHospital
}


hospitalLarge <- vector(mode = "integer", length = n)
hospitalSmall <- vector(mode = "integer", length = n)

hospitalLarge <- vapply(hospitalLarge, FUN = simHospitalLarge, FUN.VALUE = c(9.9))
hospitalSmall <- vapply(hospitalSmall, FUN = simHospitalSmall, FUN.VALUE = c(9.9))

hospitalLargeOver60Percent <- ifelse(hospitalLarge > .6, 1, 0 )
hospitalSmallOver60Percent <- ifelse(hospitalSmall > .6, 1, 0 )

cat("large:", mean(hospitalLargeOver60Percent), "small:", mean(hospitalSmallOver60Percent), "\n")

# so b. Makes sense, since it must be an integer number of boys 
# smaller hospital has over 60% with less boys over expected value
# if it were not discrete, wouldnt expect a difference


# 12: Poll simulation

percentDem1 <- 52
percentRep1 <- 48
n1 <- 1000
n2 <- 3000
numSims <- 100
percentRep2 <- 49
percentDem2 <- 51

dem <- function(percentDem, n = n){
		poll <- runif(n, min=0, max = 1)
		v <- ifelse(poll <= percentDem/100, 1, 0)
		return(mean(v))
}

simDemVsRep <- function(percent, n, size){
	v <- rep(percent, size)
	v <- mapply(FUN = dem, v, MoreArgs = list(n = n))
	return(v)
}

vPoll <- simDemVsRep(percentDem1, n = n1,size = numSims)
plot(vPoll)
abline(a = 1/2, b = 0)
vPoll <- ifelse(vPoll > .5, 1, 0) #returns one if dems win
percentageOfDemWins1 <- mean(vPoll)

vPoll2 <- simDemVsRep(percentDem2, n = n1, size = numSims)
vPoll3 <- simDemVsRep(percentDem2, n = n2, size = numSims)
percentageOfDemWins2 <-mean(vPoll2)
percentageOfDemWins3 <-mean(vPoll3)
#seems close elections are harder to poll, which makes sense
cat("First Simulation: ", percentageOfDemWins1, "\nSecond Simulation: ", percentageOfDemWins2, "\nThird Simulation: ", percentageOfDemWins3, "\n")

# 14



game14sim <- function(x){
	j <- 0
	won <- FALSE
	while(!won){
		a <- runif(1)
		if(a >= 1/2){
			won <- TRUE
		}
		j <- j + 1
	}
	payoff <- 2^j
	return(payoff)
}


n <- 1000
v <- vector(mode = "integer", length = n)
v <- vapply(FUN = game14sim, v, FUN.VALUE = c(2))
v %>% summary
#hmm really HUGE outlier of over 16k
#rerun, max is about 2k
#lets get the mean of means


game14sim2 <- function(n2){
	mat <- matrix(nrow = n, ncol = n2)
	for(i in 1:n2){
		mat[,i] <- vapply(FUN = game14sim, v, FUN.VALUE = c(2))
	}
	means <- colMeans(mat)
	return(means)
}

n2 <- 200
vMeans <- game14sim2(n2)
vMeans %>% summary


game14sim3 <- function(n2){
	mat <- matrix(nrow = n, ncol = n2)
	for(i in 1:n2){
		mat[,i] <- vapply(FUN = game14sim, v, FUN.VALUE = c(2))
	}
	return(mat)
}

# it seems the median is always around 2 - 4 but the mean is over ten.
# so if only allowed a specific number of plays, say 100
# I wouldnt pay more than 2
#but with arbitrary number of games (and I can stop any time)
# I might be willing to bet more, say up to ~$8, 
# but I would need to start with enough funds to be able to lose money many times. 
# If I had a pretty limited amount of money, I would not bet more than $4


# 6 Las Vegas Roulette
nSlots <- 38
nGreen <- 2
nRed <- (nSlots-nGreen)/2
nBlack <- nRed
n <- 1000


spin <- function(slots, red){
	val <- ceiling(slots * runif(1))
	if(val <= red) {
		return(1)
	}
	else {
		return(-1)
	}
}
spin6 <- function(x){
	spin(nSlots, nRed) %>% return
}

spin62 <- function(x){(val <- ceiling(nSlots * runif(1)))}


bets <- vector(mode="integer", length = n) %>% 
		vapply(FUN = spin6,FUN.VALUE= c(10)) 
(nbets <- bets %>% sum)
bets %>% hist

nspins <- vector(mode="integer", length = n) %>% 
		vapply(FUN = spin62,FUN.VALUE= c(10)) 

# answer: 
nbets


# 3

nDice <- 3
nSides <- 6
n <- 10000

roll <- function(d){
	val <- ceiling(d * runif(1))
}

sumOfROlls <- function(n, d){
	rep(d, n) %>%
		vapply( FUN = roll, FUN.VALUE = c(10)) %>%
		sum %>%
		return
}
sumOfROlls3 <- function(x){
	sumOfROlls(nDice, nSides)
}


v <- vector(mode = "integer", length = n) %>% 
	vapply(FUN = sumOfROlls3, FUN.VALUE = c(1))

# 3 a)

(nTen <- mean(v==10))
(nNine <- mean(v==9))

# 3 b)
# I conclude that the gamblers were correct



# 17
