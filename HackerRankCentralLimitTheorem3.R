
n <- 100
mu <- 500
s <- 80
percent <- .95
z <- 1.96


zScaled <- z * s / sqrt(n)
A <- mu - zScaled
B <- mu + zScaled
# https://stats.stackexchange.com/questions/43114/how-to-convert-to-gaussian-distribution-with-given-mean-and-standard-deviation#45409

cat(round(A, 2),"\n")
cat(round(B, 2))



sim <- replicate(1000 , rnorm())