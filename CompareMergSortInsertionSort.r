N <- 100


insSort <- function(x){
    return(8*x^2)
}

merSort<- function(x){
    return(log(x) * 64 * x)
}

mer <- c()
ins <- c()

for(i in 1:N){
    mer <- c(mer, merSort(i))
    ins <- c(ins, insSort(i))
}


merSortBetter <- mer < ins

insSortBetter <- ins < mer

equals <- mer == ins

summary(merSortBetter)
summary(insSortBetter)

head(merSortBetter, n=50)