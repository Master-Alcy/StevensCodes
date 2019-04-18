#########################################################
##  Homework: 5.2
##  Purpose: Create pretty classification tree
##  Developer: Ying Lu 
##  ID： 10431247
##
#########################################################
rm(list=ls())
#########################################################
##  Step 1: Load the relavent packages
##           
##
#########################################################
installed.packages()
#install.packages("rpart")  # CART standard package
?install.packages()
#install.packages("rpart")
#install.packages("rpart.plot")     # Enhanced tree plots
#install.packages("rattle")         # Fancy tree plot
#install.packages("RColorBrewer")   # colors needed for rattle
#install.packages("RGtk2")
library(rpart)
library(rpart.plot)  			# Enhanced tree plots
library(rattle)           # Fancy tree plot
library(RColorBrewer)     # colors needed for rattle

#########################################################
##  Step 2:  example
##           
##
#########################################################

dsn<-
  read.csv('/Users/aijingxuan/Documents/github/StevensCodes/CS-513-2019S/hw5&6/breast-cancer-wisconsin.data.csv')

dsn <- dsn[, -1]
dsn$Class <- factor(dsn$Class, levels = c("2", "4"), labels = c("Begin", "Maligant"))

set.seed(111)

index<-sort(sample(nrow(dsn), round(.25*nrow(dsn))))
training<-dsn[-index, ]
test<-dsn[index, ]

CART_class<-rpart(Class~., data = training)
rpart.plot(CART_class)

CART_predict <- predict(CART_class, test, type = "class") 
table(Actual=test[, 10], CART = CART_predict)

CART_wrong<-sum(test[, 10]!=CART_predict)
CART_error_rate<-CART_wrong/length(test[, 10])
CART_error_rate

