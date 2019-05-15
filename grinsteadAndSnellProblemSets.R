
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

cat(mean(hospitalLargeOver60Percent), mean(hospitalSmallOver60Percent), "\n")