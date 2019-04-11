#########################################################
##  Purpose: HW6.2
##  Developer: Ying Lu
##  ID: 10431247
##
#########################################################
#########################################################
##  Step 0: Clear the environment and load the data
##           
##
#########################################################

rm(list = ls())

dsn<-
  read.csv('/Users/aijingxuan/Documents/github/StevensCodes/CS-513-2019S/hw5&6/breast-cancer-wisconsin.data.csv')

### remove all the records with missing value
dsn <- na.omit(dsn)
dsn <- dsn[, -1]
dsn$Class <- factor(dsn$Class, levels = c("2", "4"), labels = c("Begin", "Maligant"))

View(dsn)

set.seed(123)

index <- sort(sample(nrow(dsn), round(.25*nrow(dsn))))
training<-dsn[-index,]
test<-dsn[index,]

#install.packages("C50", repos="http://R-Forge.R-project.org")
#install.packages("C50")

library('C50')

C50_class <- C5.0(Class~., data = training )

summary(C50_class )
#dev.off()
plot(C50_class)
C50_predict <- predict(C50_class, test, type = "class")
table(actual=test[, 10], C50 = C50_predict)
wrong <- (test[, 10] != C50_predict)
c50_rate <- sum(wrong)/length(test[, 10])
c50_rate