# importing all the data
Nick <- read.csv('/Users/eve/Documents/GitHub/Nick_Cage/Nick_Cage.csv')
critic = Nick$critic
audience = Nick$audience


boxplot(Nick)
boxplot(critic-audience)

summary(critic)
summary(audience)
summary(critic-audience)
sd(critic)
sd(audience)
sd(critic - audience)

t.test(x=critic, y=audience, alternative='two.sided', paired=T, conf.level=.8)
