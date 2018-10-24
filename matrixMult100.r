A <- matrix(c(3,1,4,1),ncol = 2)
mat <- A 
for(i in 1:99){ 
	mat <- (mat %*% A)
}
print(mat)


# inspired by:
# https://www.youtube.com/watch?v=PFDu9oVAE-g&list=PLZHQObOWTQDPD3MizzM2xVFitgF8hE_ab&index=13
# 14 min, 30 seconds


B <- matrix(c(3,0,0,2), ncol = 2)
mat2 <- B
for(i in 1:99){
	mat2 <- (mat2 %*% B)
}
print(mat2)

mat2[1,1] == 3^100 #true
mat2[2,2] == 2^100 #true
