library(e1071)
d<-read.csv(file.choose(),header=T) 
model<- naiveBayes(d[1:560,3:7],d[1:560,2])
predict(model,d[560:570,3:7])



