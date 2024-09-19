library(titanic)
library(ggplot2)

data(package='titanic')

ggplot(data=titanic_train, aes(x=Age , fill=factor(Survived))) + geom_bar(position='dodge')

