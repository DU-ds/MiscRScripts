# https://stackoverflow.com/questions/55768449/poisson-process-algorithm-in-r-renewal-processes-perspective
nproc <- 40
T0 <- 3
lambda <- 4
i <- 1

tarr <- matrix(rep(0, nproc), nrow = 1, ncol = nproc)

while(min(tarr[i, ]) <= T0){

  temp <- matrix(tarr[i, ] - log(runif(nproc))/lambda, nrow = 1) #fixed paren
  tarr <- rbind(tarr, temp)
  i = i + 1
}

tarr2 = t(tarr) #takes transpose

library(ggplot2)
library(Rfast)
min_for_each_col <- colMins(tarr2, value = TRUE)
qplot(seq_along(min_for_each_col), sort(min_for_each_col), geom="step")
qplot(seq_along(min_for_each_col), c(1:length(min_for_each_col)), geom="step", ylab="", xlab="")


df1 <- cbind(min_for_each_col, 1:length(min_for_each_col)) %>% as.data.frame
colnames(df1)[2] <- "index"
pl <- ggplot() +
    geom_step(data = df1, mapping = aes(x = min_for_each_col, y = index), color = "blue")
pl + labs(x = "", y = "")


ggplot() +
  geom_step(data = df1, mapping = aes(x = min_for_each_col, y = index), color = "blue") +
    labs(x = "", y = "")

