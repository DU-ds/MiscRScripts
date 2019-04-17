# https://www.hackerrank.com/challenges/s10-mcq-2/problem
library(magrittr)

#red = 0
# black = 1
X <- c(rep(0, 4), rep(1, 3))
Y <- c(rep(0, 5), rep(1, 4))
Z <- c(rep(0, 4), rep(1, 4))
xlen <- X %>% length
ylen <- Y %>% length
zlen <- Z %>% length
count <- 0
yes <- 0


for(i in 1:xlen)
{
	for(j in 1:ylen)
	{
		for(k in 1:zlen)
		{
			count <- (count + 1)
			sum = Z[k] + Y[j] + X[i]
			
			if(sum == 1){#one black, two red
				yes <- (yes + 1)
			}

		}
	}

}
cat(yes, " / ", count, "\n")
#17/42

#didnt use but still fun!
xdraw <- function() {
	ceiling(runif(1, min = 0, max = xlen) )
}
ydraw <- function() {
	ceiling(runif(1, min = 0, max = ylen) )
}
zdraw <- function() {
	ceiling(runif(1, min = 0, max = zlen ))
}