
k <- 31
mu <- 6
std <- 0.22
n <- 100000000
v <- c()

for(i in 1:n){
    rand_draw <- rnorm(k, mean = mu, sd = std)
    bool <- ifelse(rand_draw > 6, 1, 0)
    bool <- sum(bool) >= 17
    v <- c(v, bool)
}
print(sum(v)/n) #part 2

# https://www.reddit.com/r/AskStatistics/comments/cewvps/normal_distribution_help/
# I'm not sure where to begin with this problem; am I able to calculate this by hand, or am I supposed to use R-commander or something? Thanks.

# The weights of cans of Ocean brand tuna are supposed to have a net weight of 6.0 ounces. The manufacturer tells you that the net weight is actually a Normal random variable with a mean of 6 ounces and a standard deviation of 0.22 ounces. Suppose that you draw a random sample of 31 such cans.

# Part i) Using the information about the distribution of the net weight given by the manufacturer, find the probability that the mean weight of the sample is less than 5.98 ounces. (Please carry answers to at least six decimal places in intermediate steps. Give your final answer to the nearest three decimal places).

# Probability (as a proportion) = ?

# Part ii) Using the Normal approximation, which of the following is the probability that more than 52 % of the sampled cans are overweight (i.e., the net weight exceeds 6 ounces)?

# A. 0.4119B. 0.5881C. 0.987D. 0.013E. 0.4557


pnorm(5.98, mean = mu, sd = std) #part 1

