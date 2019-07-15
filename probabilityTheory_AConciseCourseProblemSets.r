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

