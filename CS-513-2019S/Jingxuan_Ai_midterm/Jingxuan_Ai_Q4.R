## Jingxuan Ai 10431517
rm(list=ls())

## Input data as vector
vector<-c(45,48,6,42,49,63,81,56,21,75,25,48,56,24,73,82,NA,80,86,88)
sumArray<-summary(vector)

## min
min<-sumArray[1]
min
## max
max<-sumArray[6]
max
## mean
mean<-sumArray[4]
mean
## median
median<-sumArray[3]
median
## standard deviation
sd<-sd(vector,na.rm=TRUE)
sd

## replace missing with mean
for(i in 1:length(vector)){
  if(is.na(vector[i])){
    vector[i] <- mean
  }
}
vector

## box plot
vectorMatrix<-as.data.frame(as.matrix(vector))
boxplot(vectorMatrix,range=10)

