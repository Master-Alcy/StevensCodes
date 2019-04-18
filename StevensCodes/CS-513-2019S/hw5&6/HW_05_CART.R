## Jingxuan Ai 10431517
rm(list=ls())

#install.packages("rpart")
#install.packages("rpart.plot")
#install.packages("rattle")
#install.packages("RColorBrewer")
library(rpart)
library(rpart.plot)
library(rattle)
library(RColorBrewer)

rawData <- read.csv('/Users/aijingxuan/Documents/github/StevensCodes/CS-513-2019S/hw5&6/breast-cancer-wisconsin.data.csv')
data <- na.omit(rawData)
data$Class <- factor(data$Class, levels = c(2,4),labels=c("Benign","Malignant"))

set.seed(111)
index<-sort(sample(nrow(data), round(.25*nrow(data))))
training<-data[-index,]
test<-data[index,]

curr<-rpart( Class~.,data=training)
fancyRpartPlot(curr)

future<-predict( curr ,test , type="class" )
table(actual=test[,11],future)

error_rate<- (test[,11]!=future)
err<-sum(error_rate)/length(error_rate)
err
