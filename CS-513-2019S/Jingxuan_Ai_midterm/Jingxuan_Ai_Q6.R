## Jingxuan Ai 10431517
rm(list=ls())

data<-read.csv("/Users/aijingxuan/Desktop/IBM_Employee_Attrition_v1.csv")
View(data)

## a) remove missing
removed<-data[-which(is.na(data$MonthlyIncome)),]
removed

## b) select every third record as the test dataset and the remaining records as the training dataset
index<-seq(3,nrow(removed),3)
index
test_data<-removed[index,]
test_data
training_data<-removed[-index,]
training_data

## c) perform naive bayes
install.packages('e1071', dependencies = TRUE)
library(class) 
library(e1071)

naive<-naiveBayes(Attrition ~ JobSatisfaction + Single + Gender, data = training_data)
naive

## d) score
predict<-predict(naive,test_data )
table(NBayes = predict, Survived = test_data $ Attrition)

## e) error rate
error_rate <- sum(predict != test_data $ Attrition) / length(predict)
error_rate

