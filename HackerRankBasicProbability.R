
#https://www.hackerrank.com/challenges/s10-mcq-1/problem
n <- 6
cutoff <- 9
lessthan <- 0
vless <- c(0)
count <- 0

for(i in 1:n){
	for(j in 1:n){
		sum = i + j
		if(sum > 9){
		} else{
			lessthan <- lessthan + 1;
		vless <- c(vless,i,j)
		}
		count <- count +1
	}
}
vless <- vless[-1]
print(lessthan)
print(vless)
print(count)
print("ANS:") 
cat(lessthan/count)
