###  Company  : Stevens 
#  Project    : CS-513 Knowledge Dis & Data Mining 
#  Purpose    : Homework_6_C50
#  First Name	: Zihao
#  Last Name	: Chen
#  Id			    : 10441764
#  Date       : 04/09/2019
#  Comments   :

### Clear the environment
rm(list=ls())
dev.off()

### Load the relavent packages
library('C50')

### Load data
bc<-read.csv('breast-cancer-wisconsin.data.csv')


### Remove Na value
bc2<-na.omit(bc)
attach(bc2)
bc2$Class<-
  factor(bc2$Class,levels = c(2,4),labels=c("benign","malignant"))

### Inital training and test data
index <- seq (1,nrow(bc2),by=5)
test<-bc2[index,]
training<-bc2[-index,]

### Grow the tree
### Drop the EmployeeID
mytree <- C5.0( factor(Class)~., data =training[,-1] )

### Plot the tree
plot(mytree)

### Predict the result for test data
prediction<-predict( mytree ,test[,-1] , type="class" )

### Use the table to interpret the resutls
table(actual=test[,11],prediction)

### Evaluate the tree by erro rate
wrong<- (test[,11]!=prediction)
rate<-sum(wrong)/length(wrong)
rate
