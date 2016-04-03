## IS4250 Group Project

# Author: Group 26 (Team Catalytics)

# Import Data
rabiesData <- read.csv("~/Copy/AY 1516 Semester 2/IS4250/Project/IS4250 G26 Catalytics/rabiesData.csv")
municipalitiesData <- read.csv("~/Copy/AY 1516 Semester 2/IS4250/Project/IS4250 G26 Catalytics/municipalitiesData.csv")

View(rabiesData)
View(municipalitiesData)

# Declare Variables
unvaccinated = municipalitiesData$Unvaccinated.Animals...
bites = municipalitiesData$Bites.per.1000.residents
name = municipalitiesData$Municipality

# Univariate Data Analysis
summary(bites)
summary(unvaccinated)

# Scatter Plot
plot(unvaccinated, bites, xlab="Percentage of Unvaccinated Animals", ylab="No. of Bites per 1,000 Residents")
abline(v=mean(unvaccinated, na.rm=TRUE), col="orange")
abline(h=mean(bites, na.rm=TRUE), col="orange")
text(unvaccinated, bites, labels=name, cex= 0.5, pos=1)

hist(rabiesData$Season)
