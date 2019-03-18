log10(exp(1))
log10(10) / log(10)
integrate(function(x){log10(x)/log(x)},0,1)

for(i in 0:7)
{
	print(integrate(function(x) {log10(x)/log(x)},0,10^i))
}


log(10,2) / log(10,8)
for(i in 0:7)
{
	print(integrate(function(x) {log(x,2)/log(x,8)},0,10^i))
}
#notice that it doesn't matter the base
#also the integral isn't really important here

log(10,2)/log(10,exp(1))
log(4*pi,2)/log(4*pi,exp(1))

tau <- 2*pi
a <- 16
b <- 60

for(i in 1:10) #0:10 would cause a divide by zero issue
{
	print(log((tau)^i,a)/log((tau)^i,b))
}
for (i in 1:10)
{
	print(log((tau)^i,a)/log(10,exp(1)))
	print(log10((tau)^i))
	print("================")
}

log_2 <- function(x)
{
	log(x)/log(2)
}
#log2 already exists