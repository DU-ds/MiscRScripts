# https://www.hackerrank.com/challenges/s10-the-central-limit-theorem-2/problem
mu <- 2.4
s <- 2
available <- 250
nStudents <- 100
n <- 5 * (10^4)

ans1 <- pnorm(available, mean = nStudents * mu, sd = s * sqrt(nStudents))


sim <- replicate(n,  rnorm( nStudents, mean = mu, sd = s ))
colSums(sim) -> v
bool <- ifelse(v < available, 0, 1)
ans2 <- 1 - (sum(bool)/ n)
