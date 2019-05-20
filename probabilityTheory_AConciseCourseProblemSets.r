#probability theory: A concise course by Y.A. Rozanov

#Chapter 1:

#1
1/factorial(4)

#2
# 1 cube with all sides painted cut into 1000 cubes. 10 * 10 * 10 = 1000, 
# so each of the three axixs(axes?) is cut into ten pieces
# each cube can have 0,1,2,3 faces painted, 
# 6 cubes have 3 painted faces - 6 corners
# 96 cubes have 2 painted faces - 3 axes * 8 cubes left on each edge after removing the corners * four sides of each face (faces are squares)
# 384 cubes have 1 painted face - 6 sides * 8^2  cubes left on each side after removing cubes with > 1 side painted
# 514 cubes have 0 painted faces - 1000 cubes - 384 - 96 - 6 (cubes with >=1 faces painted)
96/1000

#5
#pr(hit)
a <- 0.8
b <- 0.7
#pr(neither a nor b hit)
a2 <- 1-a
b2 <- 1-b
cat(b2*a2)
#ans
1-(b2*a2)

#7
# 4 threes, 4 sevens, 4 aces
# (a, b, c)

# total number of ways to choose 3 cards
N <- choose(52,3)
# number of ways to chose three seven and ace
n <- 4^3
# N(a)/N
n/N


#14
stirling <- function(n){
	return(sqrt(2*pi*n) * ((n^n) / exp(n)))
}
chooseWIthStirling <- function(n, k) {
	num <- stirling(n)
	den <- stirling(k) * stirling(n - k)
	return(num/den)
}
chooseWIthStirling(26,13)^2 / chooseWIthStirling(52,26)


# 15
n <- 2^50
N <- chooseWIthStirling(100,50)
n/N

#Chapter 2
#1 
# a) AB = A
# Since AB = A intersection B, AB = A --> A = B

# b) ABC = A --> A = B = C

# c) A union B union C = A --> B is a subset of A and C is a subset of A

# 2
# a) A union B = not A
# B = 

# by the identity if A = A1 union A2, then not A = not A1 union not A2
# not not A = not A union not B
# A = not A union not B
# Since for any set L, L intersection not L = empty set
# and L union not L = Omega  
# Let the sample space be Omega. then, not A = Omega - A
# A union B = not A --> A union B = Omega - A
# if A = empty set, then Omega = B
# if A =/= empty set, then A = not A intersection not B
# it seems that the only way this is true is if
# A is the empty set and B is Omega

# b) AB = not A

# 3

# 5
# A union B = Omega
# AB = empty set


# 15
# Test the approximation (2.14) for n = 3,4,5,6

two.14 <- function(n){
	sum <- 0
	for(i in 1:n){
		sum <- sum - (((-1)^i)/factorial(i))
	}
    return(sum)
}

approxtwo.14 <- 1- exp(-1)

(n3 <- two.14(3))
(n4 <- two.14(4))
(n5 <- two.14(5))
(n6 <- two.14(6))


(n3 - approxtwo.14)
(n4 - approxtwo.14)
(n5 - approxtwo.14)
(n6 - approxtwo.14)

cat(n3 - approxtwo.14, "\n", n4 - approxtwo.14, "\n", n5 - approxtwo.14, "\n", n6 - approxtwo.14, "\n")

