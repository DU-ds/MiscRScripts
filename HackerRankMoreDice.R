# Task
# In a single toss of 2 fair (evenly-weighted) six-sided dice, find the probability that 
# the values rolled by each die will be different and the two dice have a sum of 6. 
# https://www.hackerrank.com/challenges/s10-mcq-2/problem

n <- 6
val <- 6
count <- 0
yes <- 0

for(i in 1:n)
{
	for(j in 1:n)
	{
		sum = i + j
		if(sum == 6 && i != j)
		{
			yes <- yes + 1
		}
		count <- count + 1
	}
}

print("ANS:")
cat(yes " / " count)
