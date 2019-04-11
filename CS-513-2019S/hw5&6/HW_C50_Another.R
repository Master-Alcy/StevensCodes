#################################################
#  Company    : Stevens 
#  Project    : C5.0 
#  Purpose    : HW6.2
#  First Name : Jiaxian
#  Last Name  : Xing
#  Id			    : 10439460
#  Date       : 04/09
#  Comments   :
#################################################
rm(list = ls())

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

library('C50')
C50_class <- C5.0( Class~.,data=training[,-1])

summary(C50_class )
dev.off()
plot(C50_class)
C50_predict<-predict( C50_class ,test , type="class" )
table(actual=test[,11],C50=C50_predict)
wrong<- (test[,11]!=C50_predict)
c50_rate<-sum(wrong)/length(test[,11])
c50_rate
