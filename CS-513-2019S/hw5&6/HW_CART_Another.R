<<<<<<< HEAD
#################################################
#  Company    : Stevens 
#  Project    : CART 
#  Purpose    : HW5.2
#  First Name : Jiaxian
#  Last Name  : Xing
#  Id			    : 10439460
#  Date       : 04/09
#  Comments   :
#################################################
rm(list = ls())

#install.packages("rpart")
#install.packages("rpart.plot")
#install.packages("rattle")
#install.packages("RColorBrewer")
library(rpart)
library(rpart.plot)
library(rattle)
library(RColorBrewer)

#read data
file_name <- file.choose()
breast <- read.csv(file_name,
                na.strings = "?",
                colClasses=c("Sample"="character",
                             "F1"="factor","F2"="factor","F3"="factor",
                             "F4"="factor","F5"="factor","F6"="factor",
                             "F7"="factor","F8"="factor","F9"="factor",
                             "Class"="factor"))


#set test and training
#?set.seed()
set.seed(123)
#?ifelse
index<-sort(sample(nrow(breast),round(.25*nrow(breast))))
training<-breast[-index,]
test<-breast[index,]


#grow the tree
#?rpart()
dev.off()
CART_class<-rpart(Class~., data = training[,-1])
rpart.plot(CART_class)
CART_predict2<-predict(CART_class,test,type="class")
table(actual = test[,11], CART_predict2)


#error rate
CART_wrong<-sum(test[,11]!= CART_predict2)
CART_error_rate<-CART_wrong/length(test[,11])
CART_error_rate
=======
#################################################
#  Company    : Stevens 
#  Project    : CART 
#  Purpose    : HW5.2
#  First Name : Jiaxian
#  Last Name  : Xing
#  Id			    : 10439460
#  Date       : 04/09
#  Comments   :
#################################################
rm(list = ls())

#install.packages("rpart")
#install.packages("rpart.plot")
#install.packages("rattle")
#install.packages("RColorBrewer")
library(rpart)
library(rpart.plot)
library(rattle)
library(RColorBrewer)

#read data
file_name <- file.choose()
breast <- read.csv(file_name,
                na.strings = "?",
                colClasses=c("Sample"="character",
                             "F1"="factor","F2"="factor","F3"="factor",
                             "F4"="factor","F5"="factor","F6"="factor",
                             "F7"="factor","F8"="factor","F9"="factor",
                             "Class"="factor"))


#set test and training
#?set.seed()
set.seed(123)
#?ifelse
index<-sort(sample(nrow(breast),round(.25*nrow(breast))))
training<-breast[-index,]
test<-breast[index,]


#grow the tree
#?rpart()
dev.off()
CART_class<-rpart(Class~., data = training[,-1])
rpart.plot(CART_class)
CART_predict2<-predict(CART_class,test,type="class")
table(actual = test[,11], CART_predict2)


#error rate
CART_wrong<-sum(test[,11]!= CART_predict2)
CART_error_rate<-CART_wrong/length(test[,11])
CART_error_rate
>>>>>>> refs/remotes/origin/master
