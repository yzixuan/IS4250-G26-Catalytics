##If you have not installed the package
install.packages("pscl")

library(lmtest)
library(pscl)

install.packages("pscl")

###Cleaning of Data####

colnames(regression.data)[6] <- "Bites"

regression.data$Dog.Bites<-regression.data$Dog.Bites*regression.data$Population.Count/1000
regression.data$Dog.Bites<-round(regression.data$Dog.Bites,0)

regression.data$Bites<-regression.data$Bites*regression.data$Population.Count/1000
regression.data$Bites<-round(regression.data$Bites,0)

regression.data$offset<-(regression.data$Population.Count * 2)

regression.data$Vets<-runif(16, min=0, max=4.3)  
regression.data$interaction<-regression.data$Urban * regression.data$Vets

####Modelling Begins #####
test<-glm(regression.data$Dog.Bites~regression.data$Urban +regression.data$Vets  
+ regression.data$interaction, family="poisson", offset=log(regression.data$offset))
summary(test)

test2<-glm.nb(regression.data$Dog.Bites~regression.data$Urban +regression.data$Vets)

summary(test2)

anova(test, test2, test="Chisq")

## Pseudo R-dquare: McFadden???s R2
pR2(test,McFadden)
pR2(test2,McFadden)

test3<-glm(regression.data$Bites~regression.data$Urban +regression.data$Vets  
          + regression.data$interaction, family="poisson", offset=log(regression.data$offset))
summary(test3)

test4<-glm.nb(regression.data$Bites~regression.data$Urban +regression.data$Vets)

summary(test4)

anova(test3, test4, test="Chisq")

## Pseudo R-dquare: McFadden???s R2
pR2(test3,McFadden)
pR2(test4,McFadden)


##Part 2 #####

regression.data$unvaccinatedAnimals = rabbiesData$Unvaccinated.Animals.
regression.data$unvaccinatedDogs = rabbiesData$Unvaccinated.Dogs.

fit <- lm( unvaccinatedAnimals ~ Vets + Urban, data=regression.data)
summary(fit)

fit2 <- glm( unvaccinatedAnimals/100 ~ Vets + Urban, data=regression.data, family="binomial")
summary(fit2)
pR2(fit2,McFadden)

fit3<- lm( unvaccinatedDogs ~ Vets + Urban, data=regression.data)
summary(fit3)

fit4 <- glm( unvaccinatedDogs/100 ~ Vets + Urban, data=regression.data, family="binomial")
summary(fit4)
pR2(fit4,McFadden)

