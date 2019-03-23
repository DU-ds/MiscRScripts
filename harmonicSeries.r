
# Harmonic Series

# How We Got From There To Here:
# A Story of Real Analysis
# rate of convergence: page 130 - 132, 
# Harmonic Series also appears on pages 56 and 150.
n <- 10^9
a <- 0
for (i in 1:n) {
a <- (a + (1/i))
}

a


n2 <- 10^4
a2 <- 0
for( i in 1:n2)
{
	a2 <- (a2 + (1/i))
}

a2

n3 <- 10 ^ 7
a3 <- 0 
for(i in 1:n3)
{
	a3 <- (a3 + (1/i))
}

a3


n4 <- 100
a4 <- 0
for(i in 1:n4)
{
	a4 <- (a4 + (1/i))
}

print(a4)
