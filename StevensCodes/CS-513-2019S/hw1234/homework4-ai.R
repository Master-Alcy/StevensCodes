# Jingxuan Ai 10431517
rm(list=ls())
install.packages('e1071', dependencies = TRUE)
library(class)
library(e1071)

breast_cancer<-read.csv("/Users/aijingxuan/Desktop/breast-cancer-wisconsin.data.csv",na.strings = c("?"))
View(breast_cancer)

breast_cancer$Class = factor(breast_cancer$Class)
class(breast_cancer$Class)

missIndex<-is.na(breast_cancer$F6)
processedData<-breast_cancer[!missIndex,]
View(processedData)

currIndex<-sort(sample(nrow(processedData),as.integer(.7*nrow(processedData))))

training_data<-processedData[currIndex,]
test_data<-processedData[-currIndex,]

naive_all<-naiveBayes(Class~F1+F2+F3+F4+F5+F6+F7+F8+F9,data=training_data)
predicted_all<-predict(naive_all,test_data)

table(naive_all=predicted_all,Class=test_data$Class)
error<-sum(predicted_all!=test_data$Class)
final_error_rate<-error/length(predicted_all)
final_error_rate
