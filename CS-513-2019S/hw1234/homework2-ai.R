# Jingxuan Ai 10431517
#1-Load the “breast-cancer-wisconsin.data.csv” from canvas into R and perform the EDA analysis 
breast_cancer<- read.csv("/Users/aijingxuan/Desktop/breast-cancer-wisconsin.data.csv",na.strings = c("?"))
View(breast_cancer) 
is.data.frame(breast_cancer)

#I.	Summarizing each column (e.g. min, max, mean )
cat("Mean of col F1: ", mean(breast_cancer[["F1"]]), "Min of col F1: ", min(breast_cancer[["F1"]]), "Max of col F1: ", max(breast_cancer[["F1"]]))
cat("Mean of col F2: ", mean(breast_cancer[["F2"]]), "Min of col F2: ", min(breast_cancer[["F2"]]), "Max of col F2: ", max(breast_cancer[["F2"]]))
cat("Mean of col F3: ", mean(breast_cancer[["F3"]]), "Min of col F3: ", min(breast_cancer[["F3"]]), "Max of col F3: ", max(breast_cancer[["F3"]]))
cat("Mean of col F4: ", mean(breast_cancer[["F4"]]), "Min of col F4: ", min(breast_cancer[["F4"]]), "Max of col F4: ", max(breast_cancer[["F4"]]))
cat("Mean of col F5: ", mean(breast_cancer[["F5"]]), "Min of col F5: ", min(breast_cancer[["F5"]]), "Max of col F5: ", max(breast_cancer[["F5"]]))
cat("Mean of col F6: ", mean(breast_cancer[["F6"]]), "Min of col F6: ", min(breast_cancer[["F6"]]), "Max of col F6: ", max(breast_cancer[["F6"]]))
cat("Mean of col F7: ", mean(breast_cancer[["F7"]]), "Min of col F7: ", min(breast_cancer[["F7"]]), "Max of col F7: ", max(breast_cancer[["F7"]]))
cat("Mean of col F8: ", mean(breast_cancer[["F8"]]), "Min of col F8: ", min(breast_cancer[["F8"]]), "Max of col F8: ", max(breast_cancer[["F8"]]))
cat("Mean of col F9: ", mean(breast_cancer[["F9"]]), "Min of col F9: ", min(breast_cancer[["F9"]]), "Max of col F9: ", max(breast_cancer[["F9"]]))

#II.	Identifying missing values
which(is.na(breast_cancer$F6)) 
missValues<- breast_cancer[which(is.na(breast_cancer$F6)),] 
View(missValues)

#III.	Replacing the missing values with the “mean” of the column.
ProcessedData <- breast_cancer[-which(is.na(breast_cancer$F6)),] 
View(ProcessedData)
breast_cancer[is.na(breast_cancer)] <- mean(ProcessedData[["F6"]]) 
View(breast_cancer)

#IV.	Displaying the frequency table of “Class” vs. F6
install.packages("plyr") 
library(plyr)
frequency <- ddply(breast_cancer, .(breast_cancer$Class, breast_cancer$F6), nrow) 
names(frequency) <- c("Class", "F6", "Frequency") 
View(frequency)

#V. Displaying the scatter plot of F1 to F6, one pair at a time
pairs(breast_cancer[2:7])

#VI. Show histogram box plot for columns F7 to F9
hist(breast_cancer$F7,main='Frequency for F7',xlab='F7',right=F) 
hist(breast_cancer$F8,main='Frequency for F8',xlab='F8',right=F) 
hist(breast_cancer$F9,main='Frequency for F9',xlab='F9',right=F) 
boxplot(breast_cancer$F7~breast_cancer$F9)

#2- Delete all the objects from your R- environment. 
#Reload the “breast-cancer-wisconsin.data.csv” from canvas into R. Remove any row with a missing value in any of the columns.
rm(list = ls())
breast_cancer_one<- read.csv("/Users/aijingxuan/Desktop/breast-cancer-wisconsin.data.csv",na.strings = c("?"))
View(breast_cancer_one) 
is.data.frame(breast_cancer_one)
breast_cancer_two <- breast_cancer_one[complete.cases(breast_cancer_one), ]
View(breast_cancer_two)
