d<-read.csv(file.choose(),header=T)
library(caTools)
set.seed(123)
sp=sample.split(d$diagnosis,SplitRatio = 0.75)
trs=subset(d, sp == TRUE)
ts=subset(d,sp==FALSE)
trs[-3]=scale(trs[-3])
ts[-3]=scale(ts[-3])
library(e1071)
c=svm(formula=diagnosis~.,data=trs,type='C-classification',kernel='linear')
p=predict(c,newdata = ts[-3])
p
cm=table(ts[,3],p)
cm 
library(ElemStatLearn)
set=ts
x1=seq(min(set[,1])-1,max(set[,1])+1,by =0.01)
x2=seq(min(set[,2])-1,max(set[,2])+1,by =0.01)
grid_set=expand.grid(x1,x2)
colnames(grid_set)=c('white_blood_platelets_count','red_blood_platelets_count')
y_grid=predict(c,newdata = grid_set)
plot(set[,-3],main='SVM(Test Set)',xlab='white_blood_platelets_count',ylab='red_blood_platelets_count',xlim=range(x1),ylim=range(x2))
points(grid_set,pch=21,col=ifelse(y_grid==1,'cadetblue1','chartreuse'))
points(set,pch=21,bg=ifelse(set[,3]==1,'brown1','blueviolet'))


