da<-read.csv(file.choose(),header=T)
tr<-rpart(diagnosis~.,data=da)
library("rpart.plot")
rpart.plot(tr,extra=3)

