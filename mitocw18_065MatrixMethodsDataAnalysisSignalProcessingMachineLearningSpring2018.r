# https://www.youtube.com/playlist?list=PLUl4u3cNGP63oMNUHXqIUcrkS2PivhN3k
# https://youtu.be/Xa2jPbURTjQ?t=2220

x1 <- c(0,1,0,0)
x2 <- c(0,0,1,0)
x3 <- c(0,0,0,1)
x4 <- c(1,0,0,0)
rbind(x1, x2,x3,x4)
rbind(x1, x2,x3,x4) -> x
is.matrix(x)

y <- c(1,2,3,4)
y %*% x
