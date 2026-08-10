## Day 3: Univariate & Bivariate Analysis & Visualization
###Task 1

library(tidyverse)

nhis <- read.csv("data/nhis_clean.csv")

head(nhis)
names(nhis)

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

sd(nhis$AGEP_A, na.rm=TRUE)
sd(nhis$WEIGHTLBTC_A, na.rm=TRUE)
sd(nhis$HEIGHTTC_A, na.rm=TRUE)


hist(nhis$AGEP_A, main="Age Distribution", col="lightblue")
hist(nhis$WEIGHTLBTC_A, main="Weight Distribution", col="lightgreen")
hist(nhis$HEIGHTTC_A, main="Height Distribution", col="lightpink")

ggplot(nhis, aes(AGEP_A)) +
  geom_histogram(bins=30, fill="blue") +
  ggtitle("Age Distribution")

ggplot(nhis, aes(WEIGHTLBTC_A)) +
  geom_histogram(bins=30, fill="green") +
  ggtitle("Weight Distribution")

ggplot(nhis, aes(HEIGHTTC_A)) +
  geom_histogram(bins=30, fill="pink") +
  ggtitle("Height Distribution")

boxplot(nhis$AGEP_A, main="Age Boxplot", col="lightblue")
boxplot(nhis$WEIGHTLBTC_A, main="Weight Boxplot", col="lightgreen")
boxplot(nhis$HEIGHTTC_A, main="Height Boxplot", col="lightpink")

ggplot(nhis, aes(y=AGEP_A)) +
  geom_boxplot() +
  ggtitle("Age Boxplot")

ggplot(nhis, aes(y=WEIGHTLBTC_A)) +
  geom_boxplot() +
  ggtitle("Weight Boxplot")

ggplot(nhis, aes(y=HEIGHTTC_A)) +
  geom_boxplot() +
  ggtitle("Height Boxplot")

table(nhis$SEX_A)
table(nhis$HISPALLP_A)
table(nhis$EDUCP_A)
table(nhis$PHSTAT_A)
table(nhis$LSATIS4R_A)

barplot(table(nhis$SEX_A), main="Sex Distribution", col="lightblue")
barplot(table(nhis$HISPALLP_A), main="Race/Ethnicity", col="lightgreen")
barplot(table(nhis$EDUCP_A), main="Education", col="pink")
barplot(table(nhis$PHSTAT_A), main="Health Status", col="orange")
barplot(table(nhis$LSATIS4R_A), main="Life Satisfaction", col="purple")

ggplot(nhis, aes(SEX_A)) +
  geom_bar(fill="blue") +
  ggtitle("Sex Distribution")

ggplot(nhis, aes(HISPALLP_A)) +
  geom_bar(fill="green") +
  ggtitle("Race/Ethnicity")

ggplot(nhis, aes(EDUCP_A)) +
  geom_bar(fill="pink") +
  ggtitle("Education")

ggplot(nhis, aes(PHSTAT_A)) +
  geom_bar(fill="orange") +
  ggtitle("Health Status")

ggplot(nhis, aes(LSATIS4R_A)) +
  geom_bar(fill="purple") +
  ggtitle("Life Satisfaction")

nhis <- read.csv("data/nhis_clean.csv")
head(nhis)

str(nhis)


hist(nhis$AGEP_A)