## IS4250 Group Project

# Author: Group 26 (Team Catalytics)

# Import Data
rabiesData <- read.csv("~/Copy/AY 1516 Semester 2/IS4250/Project/IS4250 G26 Catalytics/Data Simulation/rabiesData.csv")
municipalitiesData <- read.csv("~/Copy/AY 1516 Semester 2/IS4250/Project/IS4250 G26 Catalytics/Data Simulation/municipalitiesData.csv")

View(rabiesData)
View(municipalitiesData)

# Declare Variables
unvaccinated = municipalitiesData$Unvaccinated.Animals...
animal_bites = municipalitiesData$Bites.per.1000.residents
dog_bites = municipalitiesData$Dog.bites.per.1000.residents
name = municipalitiesData$Municipality

# Univariate Data Analysis
summary(animal_bites)
summary(dog_bites)
summary(unvaccinated)

# Histogram
hist(animal_bites,
     main="Histogram for Animal Bites", 
     xlab="No. of Animal Bites per 1,000 Residents", 
     xlim=c(0.5,2.5), 
     las=1, 
     breaks=5)

hist(dog_bites,
     main="Histogram for Dog Bites", 
     xlab="No. of Dog Bites per 1,000 Residents", 
     xlim=c(0.5,2.5), 
     las=1, 
     breaks=5)

# Scatter Plot
plot(unvaccinated, animal_bites, xlab="Percentage of Unvaccinated Animals", ylab="No. of Animal Bites per 1,000 Residents")
abline(v=mean(unvaccinated, na.rm=TRUE), col="orange")
abline(h=mean(animal_bites, na.rm=TRUE), col="orange")
text(unvaccinated, animal_bites, labels=name, cex= 0.5, pos=1)
