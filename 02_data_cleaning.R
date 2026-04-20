## Day 2: Data Cleaning

# load tidyverse
library (tidyverse)

# load dataset
nhis_data<-read.csv("data/NHIS _Data_2021.csv")

# select required variables 
nhis_selected <- nhis %>%
  select(
    AGEP_A,         # Age
    WEIGHTLBTC_A,   # Weight
    HEIGHTTC_A,     # Height
    SEX_A,          # Sex
    HISPALLP_A,     # Race/ethnicity
    EDUCP_A,        # Education
    PHSTAT_A,       # Health status
    LSATIS4R_A      # Life satisfaction
  )

# remove missing values
nhis_clean <- nhis_selected %>%
  filter(if_all(everything(),
                ~ !(. %in% c(7, 9, 97, 98, 99, 996, 997, 998, 999))))

# final check of cleaned dataset to ensure all missing values have been removed 
summary(nhis_clean)

# recode education variable
nhis_clean <- nhis_clean %>%
  mutate(EDUCP_A = case_when(
    EDUCP_A %in% 0:3 ~ "Less than High School",
    EDUCP_A == 4 ~ "High School Graduate",
    EDUCP_A %in% 5:7 ~ "Some College",
    EDUCP_A %in% 8:10 ~ "College Graduate or Higher"
  ))

# convert education into categorical variable
nhis_clean$EDUCP_A <- as.factor(nhis_clean$EDUCP_A)

# check categories
table(nhis_clean$EDUCP_A)

# save cleaned dataset
write.csv(nhis_clean, "data/nhis_clean.csv", row.names = FALSE)


                   