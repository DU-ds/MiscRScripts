#install.packages("magrittr") #uncomment if library function says not installed :)
library("magrittr")


df1 <- read.table("R:/R_WD/Thesis/JustDeserts/WorldValuesSurvey/ESSGSSCombinedDataset1.txt", sep = "|", header = TRUE, stringsAsFactors = FALSE)
str(df1)
df1$income %>% range()
#supposed to be ordinal from [1, 12]
#so oops didn't finish cleaning

df1$paytaxes <- df1$paytaxes %>% as.ordered()
df1$sex <- df1$sex %>% as.factor()
# #just an example of how as.ordered() works
# #uncomment and run if you want to see how it works :)
# x <- c(1,2,1,2,4,3,2,1,2,3,2,3,2,1,1,1,1,1)
# x <- as.ordered(x)
# str(x)

(incomelevels <- df1$income %>% as.ordered() %>% levels())
#the GSS coded income:
# 13  <- refused
# 98  <- Don't Know
# 99  <- no answer
# 0   <- NA 
#The ESS coded hinctnt:
#  77  <- Refusal
#  88  <- Don't know
#  99  <- No answer
# So the ESS wasn't completely cleaned. Darnit! lol

df1$income <- ifelse(df1$income > 12, NA, df1$income)
(incomelevels <- df1$income %>% as.ordered() %>% levels())

df2 <- df1[!is.na(df1$income ),]
#This looks messy so I'll explain
# is.na(df1$income) returns a boolean vector the same length as df1$income
# true if na, false if any other value
# the ! operator gives a logical not, so it flips true -> false, false -> true
# [ a, b] is indexing the datastructure
# for a dataframe, a is the row, b is the column
# since the dataframe stores variables as columns, the vector of is.na(df1$income)
# indicates if each row in that column is na
# I don't want NA so I told R to only keep the non na values
str(df1) #2339 obs
str(df2) #2095 obs
df2$income %>% range() # 1 12


df2 %>% write.table(file = "R:/R_WD/Thesis/JustDeserts/WorldValuesSurvey/ESSGSSCombinedDataset2.txt", sep = "|", col.names = TRUE, row.names = FALSE)
# ls()
# rm(list = ls())
# #I ran this but I commented it in case anyone else trys to run my code :)


df3 <- read.table(file = "R:/R_WD/Thesis/JustDeserts/WorldValuesSurvey/ESSGSSCombinedDataset2.txt", sep = "|", header = TRUE )

df3 %>% str()

