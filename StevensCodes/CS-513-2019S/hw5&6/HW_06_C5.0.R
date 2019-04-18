# Jingxuan Ai 10431517
rm(list=ls())

raw<-read.csv('/Users/aijingxuan/Documents/github/StevensCodes/CS-513-2019S/hw5&6/breast-cancer-wisconsin.data.csv')
data<-na.omit(raw)
data$Class <- factor(data$Class,levels = c(2,4),labels=c("benign","malignant"))

index <- seq (1,nrow(data),by=5)
test<-data[index,]
training<-data[-index,]

#install.packages("C50")
library('C50')

mytree <- C5.0( factor(Class)~., data =training[,-1] )
plot(mytree)

prediction<-predict( mytree ,test[,-1] , type="class" )
table(actual=test[,11],prediction)

wrong<- (test[,11]!=prediction)
rate<-sum(wrong)/length(wrong)
rate
