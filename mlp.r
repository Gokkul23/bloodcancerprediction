library(data.table)
nn<-read.csv(file.choose(),header=T)
str(nn)
pood=complete.cases(nn)
nn=nn[pood,]
str(nn)
f<-function(x)(x-min(x))/(max(x)-min(x))
nn<-as.data.frame(apply(nn[,c(2:7)],2,f))
index <- sample(nrow(nn),round(0.70*nrow(nn)))
train.nn<-nn[index,]
test.nn<-nn[-index,]
library(neuralnet)
head(nn)
nnn.nn<-neuralnet(diagnosis~.,train.nn,hidden = c(1,2,3),linear.output = T)
View(test.nn)
nnn.nn$net.result
plot(nnn.nn)
pred.nn <- compute(nnn.nn,test.nn)
pred.nn$net.result
actual_pred <- data.frame(pred<-pred.nn$net.result,actual <-test.nn$diagnosis)
cor(actual_pred)
