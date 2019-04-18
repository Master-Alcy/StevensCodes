# Jingxuan Ai 10431517
rm(list=ls())
breast_cancer<- read.csv("/Users/aijingxuan/Desktop/breast-cancer-wisconsin.data.csv",na.strings = c("?"))
View(breast_cancer)
is.data.frame(breast_cancer)

breast_cancer_new <- breast_cancer[complete.cases(breast_cancer), ]
View(breast_cancer_new)

order<-sort(sample(nrow(breast_cancer_new),as.integer(.30*nrow(breast_cancer_new))))
test_data<-breast_cancer_new[order,]
View(test_data)

training_data<-breast_cancer_new[-order,]
View(training_data)

install.packages("kknn") 
library(kknn)

predict_rate_k1<-kknn(formula=Class~., training_data, test_data, k=1, kernel="rectangular")
fit<-fitted(predict_rate_k1)
table(test_data$Class,fit)
correctness <- table(test_data$Class,fit) ["2", "2"] + table(test_data$Class,fit) ["4", "4"]
error_bias <- sum(table(test_data$Class,fit)) - correctness
error_factor <- error_bias/sum(table(test_data$Class,fit))

error_factor

predict_rate_k2<-kknn(formula=Class~., training_data, test_data, k=2, kernel="rectangular")
fit<-fitted(predict_rate_k2)
table(test_data$Class,fit) 
correctness <- table(test_data$Class,fit) ["2", "2"] + table(test_data$Class,fit) ["4", "4"]
error_bias <- sum(table(test_data$Class,fit)) - correctness
error_factor <- error_bias/sum(table(test_data$Class,fit))

error_factor

predict_rate_k5<-kknn(formula=Class~., training_data, test_data, k=5, kernel="rectangular")
fit<-fitted(predict_rate_k5)
table(test_data$Class,fit) 
correctness <- table(test_data$Class,fit) ["2", "2"] + table(test_data$Class,fit) ["4", "4"]
error_bias <- sum(table(test_data$Class,fit)) - correctness
error_factor <- error_bias/sum(table(test_data$Class,fit))

error_factor

predict_rate_rate_k10<-kknn(formula=Class~., training_data, test_data, k=10, kernel="rectangular")
fit<-fitted(predict_rate_rate_k10)
table(test_data$Class,fit) 
correctness <- table(test_data$Class,fit) ["2", "2"] + table(test_data$Class,fit) ["4", "4"]
error_bias <- sum(table(test_data$Class,fit)) - correctness
error_factor <- error_bias/sum(table(test_data$Class,fit))

error_factor

