library(magrittr)

df1 <- read.table("R:/Datasets/anes_timeseries_cdf_rawda-1948-2016.txt", header = T, sep = "|", stringsAsFactors = F)

dim(df1)

df2 <- cbind(as.numeric(df1$VCF0201), as.numeric(df1$VCF0202), as.numeric(df1$VCF0101))

dim(df2)


#dem therm, rep therm, age

for(i in 1:ncol(df2)){
    df2 <- df2[ !is.na(df2[,i]),]
}

toKeep1 <- !(df2[,1] == 98 | df2[,1] == 99)
toKeep2 <- !(df2[,2] == 98 | df2[,2] == 99)
toKeep3 <- !(df2[,3] == 0)
toKeep <- toKeep1 & toKeep2 & toKeep3

df3 <- df2[toKeep,]

fm1 <- lm(df3[,1] ~ df3[,2] + df3[,3])
#dv dem therm
#indv rep therm, age

fm1 %>% plot

fm2 <- lm(df3[,1] ~ df3[,2] * df3[,3])
#dv dem therm
#indv rep therm, age, interaction

# so age moderates the relationship
# https://psych.wisc.edu/henriques/mediator.html
# https://stats.stackexchange.com/questions/218401/testing-mediation-and-moderation-can-one-variable-function-as-both-mediator-and


fm2 %>% plot

fm3 <- lm(df3[,1] ~ df3[,3])
#dv dem therm
# indv age

plot(df3[,1] ~ df3[,3])
abline(reg = lm(df3[,1] ~ df3[,3]))
plot(fm3)#check fit
#I dont like the fit of these models


fm4 <- lm(df3[,1] ~ df3[,2])
# dv dem therm
# indv rep therm
summary(fm4)
fm4 %>% plot
#not normally distributed
fm4$resid %>% hist
#strong skew

