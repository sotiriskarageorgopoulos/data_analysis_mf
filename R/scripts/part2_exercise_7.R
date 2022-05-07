#Sotirios Karageorgopoulos
faithfull <- read.table("C:\\Users\\sotir\\Dev\\data_analysis_mf\\datasets\\faithfull.txt",sep="	",header=TRUE)

linear_regression <- lm(eruptions ~ waiting, data = faithfull)

#dot-plot with linear regression
par(mfrow=c(2,2))
plot(faithfull$waiting,faithfull$eruptions,pch = 21,bg="red",ylab="eruptions (minutes)",xlab="waiting time (minutes)",main="Eruptions - Waiting Time dot plot",
sub="The linear model is: e=0.075w-1.874, where e is eruptions and w is waiting time")
abline(linear_regression, col = "blue",pch=22)
print(summary(linear_regression)) #y=0.075628x-1.874016 and R^2=0.8108

#The 95% confidence interval of the mean eruption duration for the waiting time of 80 minutes is between 4.1048 and 4.2476 minutes.
pr <- predict(linear_regression,data.frame(waiting=80),interval="confidence")
print(pr)

plot(faithfull$waiting,linear_regression$residuals,pch=20,col="red",ylab="residuals",xlab="waiting time (minutes)",main="Residual Plot")
abline(lm(linear_regression$residuals ~ faithfull$waiting),col="green")

