A <- matrix(c(3,1,4,1),ncol = 2)
mat <- A 
for(i in 1:100){ 
	mat <- (mat %*% A)
}
print(mat)


# inspired by:
# https://www.youtube.com/watch?v=PFDu9oVAE-g&list=PLZHQObOWTQDPD3MizzM2xVFitgF8hE_ab&index=13
# 14 min, 30 seconds