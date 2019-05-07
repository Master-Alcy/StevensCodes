# Jingxuan Ai 10431517
remove(list=ls())

dataRead<-  read.csv('C:/Users/aijin/Desktop/IBM_Employee_Attrition_V2.csv')
data<-data.frame(lapply(na.omit(dataRead),as.numeric))

data_dist <- dist(data[, c(13, 8, 5)])
hclust_resutls<-hclust(data_dist)
plot(hclust_resutls)

hclust_cutree_results<-cutree(hclust_resutls, 2)
table(hclust_cutree_results,data[, 2])

kmeans_results<- kmeans(data[, c(13, 8, 5)], 2, nstart = 10)
kmeans_results$cluster
table(kmeans_results$cluster,data[, 2])