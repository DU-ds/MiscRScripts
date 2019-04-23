#my answer to this question:
#https://stackoverflow.com/questions/55764091/ordering-a-matrix-to-have-the-maximum-value-in-each-diagonal/# base R docs:
# https://stat.ethz.ch/R-manual/R-devel/library/base/html/00Index.html
vals <- c(11,0,10,0,  1,22,49,46,  0, 77, 34, 31,   66, 18, 48, 49)
mat <- matrix(vals, nrow = 4)

swap <- function(matrixRow,x,y){
	#x is diagonal index
	#y is max of the row
	indexY <- which(matrixRow == y)
	valX <- matrixRow[x]
	matrixRow[x] <- y
	matrixRow[indexY] <- valX
	return(matrixRow)
}

for(i in 1:nrow(mat)){
	rowI <- mat[i,]
	y <- max(rowI)
	mat[i,] <- swap(rowI, i, y)
}



# scap code I wrote to understand the problem better:

# swap <- function(matrix){
# 	x <- matrix #copies matrix
# 	for(i in 1:nrow(x)){
# 		#rowI <- x[i,]
# 		blankRow <- vector(length = ncol(x))
# 		maxOfRowI <- max(x[i,])
# 	#https://stackoverflow.com/questions/6522134/r-return-position-of-element-in-matrix#6522216
# 		#indexMax <- which(x[i,] == maxOfRowI)
# 		indexNotMax <- which(x[i,] != maxOfRowI)
# 		cat(indexNotMax)
# 		notMax <- x[i,indexNotMax]
# 		cat(" : ",notMax, "\n")
# 		l = 0
# 		for(j in 1:ncol(x))
# 		{
# 			if(i != j){
# 				l <- (l + 1)
# 				cat("L : ", l, "\n")
# 				blankRow[j] <- notMax[l]
# 			}
# 			else
# 			{
# 				blankRow[j] <- maxOfRowI
# 			}
# # 			if(i < j){
# # #				tmp <- indexNotMax[j]
# # 				blankRow[j] <- notMax[l]
# # 				l <- l + 1
# # 				#x[i,tmp]
# # 			}
# # 			if(j > i){
# # #				tmp <- indexNotMax[j-1] #accounts for j==i
# # 				blankRow[j] <- notMax[l]
# # 				l <- l + 1
# # 				#x[i,tmp]
# # 			}
# 		}
# 		x[i,] <- blankRow
# 	}
# 	return(x)
# }
# #replace row one with 1:4
# # x[1,] <- c(1,2,3,4)
