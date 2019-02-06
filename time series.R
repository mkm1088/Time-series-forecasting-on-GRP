rawdata<-read.csv("ActualRatings_weeklyGRP.csv")
#grp = size of an advertising campaign , not reached audience
#start(data)
View(data)
class(data)
frequency(data)

lm(GRP~GRPRatingsDate, data=rawdata)
abline(reg=lm(rawdata~time(rawdata)))
cycle(rawdata)
plot(aggregate(rawdata,FUN=mean))

#end(data)
summary(rawdata)
plot(rawdata)
abline(reg=lm(data~time(data)))
require(stats)
reg<-lm(GRP ~ GRPRatingsDate, data = rawdata)
coeff=coefficients(reg)
eq = paste0("y = ", round(coeff[2],1))
plot(rawdata, main=eq)
abline(reg, col="blue")

adf.test(diff(log(data)), alternative="stationary", k=0)
data: diff(log(raw))





GRP.lm<-lm(GRP~GRPRatingsDate, data=rawdata)
summary(GRP.lm)
