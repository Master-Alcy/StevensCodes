# Jingxuan Ai 10431517
remove(list=ls())

install.packages('neuralnet')
library("neuralnet")

dataRead<-  read.csv('C:/Users/aijin/Desktop/IBM_Employee_Attrition_V2.csv')
data<-data.frame(lapply(na.omit(dataRead),as.numeric))

index <- seq (1, nrow(data), by=5)
test<- data[index,]
training<-data[-index,]

plot1<- neuralnet( Attrition~. ,training, hidden=10, threshold=0.01)
plot(plot1)

ann <-compute(plot1 , test[, -4])
ann$net.result 

annPro<-ifelse(ann$net.result <1.5, 1, 2)
length(annPro)

table(Actual = test$Attrition, predition = annPro)

wrong<- (test$Attrition!=annPro)
error_rate<-sum(wrong) / length(wrong)
error_rate