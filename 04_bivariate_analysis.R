## Day 3: Univariate & Bivariate Analysis & Visualization
###Task 2
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














