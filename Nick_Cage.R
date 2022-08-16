# importing all the data
Nick <- read.csv('/Users/eve/Documents/GitHub/Nick_Cage/Nick_Cage.csv')
critic = Nick$critic
audience = Nick$audience

# visual analysis
library(dplyr)
plot(density(critic), main ='critic')
plot(density(audience), main ='audience')

boxplot(Nick)
boxplot(critic-audience)

# summary statistics
summary(critic)
summary(audience)
summary(critic-audience)
sd(critic)
sd(audience)
sd(critic - audience)

# NOTE: Not normal distributions, need another form of analysis
t.test(x=critic, y=audience, alternative='two.sided', paired=T, conf.level=.8)
