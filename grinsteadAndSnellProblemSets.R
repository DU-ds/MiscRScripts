
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
