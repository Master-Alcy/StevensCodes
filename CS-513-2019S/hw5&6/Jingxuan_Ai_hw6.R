# Jingxuan Ai 10431517
rm(list=ls())

raw<-read.csv('/Users/aijingxuan/Documents/github/StevensCodes/CS-513-2019S/hw5&6/breast-cancer-wisconsin.data.csv')
data<-na.omit(raw)
data <- data[, -1]
data$Class <- factor(data$Class,levels = c(2,4),labels=c("Benign","Malignant"))

set.seed(123)
index <- sort(sample(nrow(data), round(.25*nrow(data))))
test<-data[index,]
training<-data[-index,]

#install.packages("C50")
library('C50')

curr <- C5.0(Class~., data = training )
plot(curr)

future<-predict( curr, test, type = "class" )
table(actual=test[,10], C50 = future)

error<- (test[,10] != future)
error_rate <- sum(error)/length(error)
error_rate
