
#ex from pg 29
size <- 1000
n <- 1
theta <- 0.485
phi <- (1-theta)/theta
y <- rbinom(n, size = size, prob = theta)
y2 <- rbinom(n, size = size, prob = phi)

