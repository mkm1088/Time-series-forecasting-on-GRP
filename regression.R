rawdata<-read.csv("ActualRatings_weeklyGRP.csv")
pacman::p_load(tidyverse, lubridate,zoo,forecast, fUnitRoots)
library(pacman)
library(ggplot2)
sapply(rawdata, class)
str(rawdata)
head(data,3)
model=lm(GRP~as.numeric(GRPRatingsDate), data = rawdata)

index <- sample(nrow(finalData), 0.7 * nrow(finalData))
trainingData <- finalData[index, ]
testingData <- finalData[-index, ]

#rawdata$pred<-lm(GRP~., data = rawdata)
summary(model)
#rawdata$GRPRatingsDate<-as.numeric(rawdata$GRPRatingsDate)
View(rawdata)
rawdata$pred = (model$fitted.values)

ggplot(testingData, aes(t))+ 
geom_line(aes(y=GRP, colour="var0"))+
geom_line(aes(y=pred_te, colour="var1"))
res = residuals(model)
plot(jitter(res)~jitter(GRP), data=rawdata, abline)
