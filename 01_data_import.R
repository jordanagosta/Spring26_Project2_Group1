library(tidyverse)
#load libraries 

nhis_data<-read_csv(file.choose("NHIS_Data_2021.csv"))
#import dataset 

str(nhis_data)
summary(nhis_data)
head(nhis_data)
#explore

colnames(nhis_data)
#column names 

colSums(is.na(nhis_data))
#missing vales