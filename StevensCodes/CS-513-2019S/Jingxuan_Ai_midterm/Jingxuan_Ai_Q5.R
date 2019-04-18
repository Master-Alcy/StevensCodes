## Jingxuan Ai 10431517
rm(list=ls())

## read data
data <- read.csv("/Users/aijingxuan/Desktop/IBM_Employee_Attrition_v1.csv")
View(data)

## a) remove missing value rows
removed_data<-data[-which(is.na(data$MonthlyIncome)),]
removed_data

## b) select every third record as the test dataset and the remaining records as the training dataset
install.packages("kknn")
library(kknn)

index<-seq(3,nrow(removed_data),3)
index
test_data<-removed_data[index,]
test_data
training_data<-removed_data[-index,]
training_data

## c) preform K=3 unweighted
predict <- kknn(formula=factor(Attrition)~., training_data, test_data, kernel="rectangular", k=3)

## d) score test dataset
fit <- fitted(predict)
table(kknn=fit,test_data$Attrition)

## e) error rate
error_rate=sum(fit!=test_data$Attrition)/length(test_data$Attrition)
error_rate
