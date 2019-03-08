
r <- c(10,17,12,7,23,22,29,29,23)
n <- c(31,30,31,27,26,30,31,30,30) 
logconc <- c(2.68,2.76,2.82,2.9,3.02,3.04,3.13,3.2,3.21)
counts <- cbind(r,n-r)
#https://newonlinecourses.science.psu.edu/stat504/node/162/
#https://newonlinecourses.science.psu.edu/stat504/node/161/
result <- glm(counts~logconc, family=binomial("logit"))
summary(result, correlation=TRUE,symbolic.cor=TRUE)
plot(result)
chi2 <- sum(residuals(result,type = "pearson")^2)
#https://stats.stackexchange.com/questions/29653/how-can-i-compute-pearsons-chi2-test-statistic-for-lack-of-fit-on-a-logisti
degreesOfFreedom <- length(logconc) - ncol(counts)


#https://newonlinecourses.science.psu.edu/stat504/node/168/



#https://newonlinecourses.science.psu.edu/stat504/node/169/
url <- "https://newonlinecourses.science.psu.edu/stat504/sites/onlinecourses.science.psu.edu.stat504/files/lesson07/crab/index.txt"
df1 <- read.table(url, header = F)
#Obs, C, S, W, Wt, Sa - from grapic on node 223

#https://www.r-bloggers.com/r-sorting-a-data-frame-by-the-contents-of-a-column/
df2 <- df1[order(df1$V4),]
#https://stackoverflow.com/questions/6081439/changing-column-names-of-a-data-frame
colnames(df1)[4] <- "W"
colnames(df1)[6] <- "Sa"

fm1 <- glm(Sa~1+W,data=df1,family=poisson(link=log))
print <- data.frame(df1,pred=fm1$fitted)
print
fm1$linear.predictors
# "The estimated model is: log(^μi)
# = -3.30476 + 0.16405Wi
# The ASE of estimated β = 0.164 is 0.01997 which is small, and the slope is statistically significant given its z-value of 8.216 and its low p-value.
# Interpretation: Since estimate of β > 0, the wider the female crab, the greater expected number of male satellites on the multiplicative order as exp(0.1640) = 1.18. More specifically, for one unit of increase in the width, the number of Sa will increase and it will be multiplied by 1.18."


summary(fm1)
#"We can also see that although the predictor is significant the model does not fit well. 
#Given the value of the residual deviance statistic of 567.88 with 171 df, the p-value 
#is zero and the Value/DF=567.88/171=3.321 is much bigger than 1, so the model does not 
#fit well. The lack of fit maybe due to missing data, covariates or overdispersion."





#https://newonlinecourses.science.psu.edu/stat504/node/170/
url2 <- "https://newonlinecourses.science.psu.edu/stat504/sites/onlinecourses.science.psu.edu.stat504/files/lesson07/creditcard/index.txt"

df3 <- read.table(url2, header = F)
df3$lcases <- log(df3[,2])
str(df3)

colnames(df3) <- c("income", "cases", "CrCards", "lcases")
str(df3)

fm2 <- glm(CrCards~ income+offset(lcases), family = poisson,data = df3)
summary.glm(fm2)
fm3 <- glm(CrCards~ income,offset=lcases, family = poisson,data = df3)
summary.glm(fm3)
#Question asked: are they the same?

#Rememeber:
#"By adding “offset” in the MODEL statement in GLM in R we can specify an
# offset variable. The offset variable serves to normalize the fitted cell
# means per some space, grouping or time interval in order to model the rates."

#Just b/c I'm curious:

fm4<- glm(CrCards~income, family = poisson, data = df3)
summary.glm(fm4)
fm5<- lm(income~CrCards,data = df3)
summary.glm(fm5)
fm6 <- glm(income~CrCards,data = df3, family = gaussian(link = identity))
summary.glm(fm6)


