## Day 3: Univariate & Bivariate Analysis & Visualization
###Task 1

library(tidyverse)

nhis <- read.csv("data/nhis_clean.csv")

head(nhis)
nhis <- read.csv(file.choose())

nhis$AGEP_A <- as.numeric(as.character(nhis$AGEP_A))
nhis$WEIGHTLBTC_A <- as.numeric(as.character(nhis$WEIGHTLBTC_A))
nhis$HEIGHTTC_A <- as.numeric(as.character(nhis$HEIGHTTC_A))

nhis$SEX_A <- as.factor(nhis$SEX_A)
nhis$HISPALLP_A <- as.factor(nhis$HISPALLP_A)
nhis$EDUCP_A <- as.factor(nhis$EDUCP_A)
nhis$PHSTAT_A <- as.factor(nhis$PHSTAT_A)
nhis$LSATIS4R_A <- as.factor(nhis$LSATIS4R_A)

summary(nhis$AGEP_A)
summary(nhis$WEIGHTLBTC_A)
summary(nhis$HEIGHTTC_A)

hist(nhis$AGEP_A, main="Age Distribution", col="lightblue")
hist(nhis$WEIGHTLBTC_A, main="Weight Distribution", col="lightgreen")
hist(nhis$HEIGHTTC_A, main="Height Distribution", col="lightpink")

boxplot(nhis$AGEP_A, main="Age Boxplot")
boxplot(nhis$WEIGHTLBTC_A, main="Weight Boxplot")
boxplot(nhis$HEIGHTTC_A, main="Height Boxplot")

barplot(table(nhis$SEX_A), main="Sex Distribution", col="lightblue")
barplot(table(nhis$HISPALLP_A), main="Race/Ethnicity", col="lightgreen")
barplot(table(nhis$EDUCP_A), main="Education", col="pink")
barplot(table(nhis$PHSTAT_A), main="Health Status", col="orange")
barplot(table(nhis$LSATIS4R_A), main="Life Satisfaction", col="purple")




boxplot(AGEP_A ~ SEX_A, data=nhis, main="Age by Sex")

boxplot(AGEP_A ~ EDUCP_A, data=nhis, main="Age by Education")


barplot(table(nhis$PHSTAT_A, nhis$LSATIS4R_A),
        beside=TRUE,
        legend=TRUE,
        main="Health vs Life Satisfaction")


plot(nhis$HEIGHTTC_A, nhis$WEIGHTLBTC_A,
     main="Height vs Weight",
     xlab="Height",
     ylab="Weight")

cor(nhis$HEIGHTTC_A, nhis$WEIGHTLBTC_A, use="complete.obs")






