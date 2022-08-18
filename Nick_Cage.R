############# importing all the data #############

Nick <- read.csv('/Users/eve/Documents/GitHub/Nick_Cage/Nick_Cage.csv')
critic = Nick$critic
audience = Nick$audience

############# visual analysis #############

library(dplyr)
plot(density(critic), main ='critic')
plot(density(audience), main ='audience')
# ^ critic and audience scores appear to follow a bimodal distribution

library("car")
plot(density(critic - audience))
qqPlot(critic - audience)
# ^ the difference appears to follow a normal distribution

boxplot(Nick)
boxplot(critic-audience)

############# summary statistics #############

summary(critic)
summary(audience)
summary(critic-audience) # mean: -5.02
sd(critic)
sd(audience)
sd(critic - audience) # sigma: 20.540

############# analysis #############

# Z test to determine whether critics and audiences rate Nicholas Cage films
# differently with 5% significance level
pnorm(-5.02,0,20.540) # p-val = .403, no significant difference between critic
                      # and audience ratings

