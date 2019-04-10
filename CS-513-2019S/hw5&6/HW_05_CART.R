## Jingxuan Ai 10431517

### Clear the environment
rm(list=ls())

### Load the relavent packages
install.packages("rpart")
install.packages("rpart.plot")
install.packages("rattle")
install.packages("RColorBrewer")
library(rpart)
library(rpart.plot)  			# Enhanced tree plots
library(rattle)           # Fancy tree plot
library(RColorBrewer)     # colors needed for rattle

### Load data
bc<-read.csv('breast-cancer-wisconsin.data.csv')


### Remove Na value
bc2<-na.omit(bc)
attach(bc2)
bc2$Class<-factor(bc2$Class,levels = c(2,4),labels=c("benign","malignant"))

### Inital training and test data
indx<-seq(from=1, to=nrow(bc2), by=5)
test<-bc2[indx,]
training<-bc2[-indx,]

### EmployeeId is useless don't consider that column
drop_col<-c(which(colnames(bc2)=="Sample"))

### Grow the tree
mytree<-rpart( Class~.,data=training[,-drop_col])

### Plot the tree
fancyRpartPlot(mytree)

### Predict the result for test data
prediction<-predict( mytree ,test[,-drop_col] , type="class" )

### Use the table to interpret the resutls
table(actual=test[,11],prediction)

### Evaluate the tree by erro rate
wrong<- (test[,11]!=prediction)
rate<-sum(wrong)/length(wrong)
rate

### Using another predict method
prediction2<-predict( mytree ,test[,-drop_col] )
predict2<-ifelse(prediction2[,1]<=0.5,"benign","malignant")
table(actual=test[,11],prediction)
wrong<- (test[,11]!=prediction)
rate<-sum(wrong)/length(wrong)
rate
