data(iris)
library(tidyverse)
#ggplot(data=iris,aes(x=Sepal.Length,y=Sepal.Width)) + geom_point() + theme_bw()
#ggplot(data=iris,aes(x=Petal.Length,y=Petal.Width,color=Species)) + geom_point() + theme_bw()
#model<-lm(data=iris,formula = Sepal.Length ~ Sepal.Width + Petal.Length + Petal.Width)
#summary(model)
train<-rbind(iris[1:40, ],iris[51:90, ],iris[101:140, ])
test<-rbind(iris[41:50, ],iris[91:100, ],iris[141:150, ])
model<-lm(data=train,Sepal.Length~Sepal.Width+Petal.Length+Petal.Width)

prediction<-predict(model, test)
prediction
var<-prediction-test$Sepal.Length
Rms<-sqrt(mean(var^2))
print(Rms)
