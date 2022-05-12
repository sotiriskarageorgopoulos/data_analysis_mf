install.packages('pROC')
library(pROC)

install.packages("ROCR") 
library(ROCR)

class <- c('+','+','-','-','+','+','-','-','+','-')
m1 <- c(0.73,0.69,0.44,0.55,0.67,0.47,0.08,0.15,0.45,0.35)
m2 <- c(0.61,0.03,0.68,0.31,0.45,0.09,0.38,0.05,0.01,0.04)

df <- data.frame(class,m1,m2)

pred1 <- prediction(df$m1,df$class)
pred2 <- prediction(df$m2,df$class)

roc1 <- performance(pred1,"tpr","fpr")
roc2 <- performance(pred2,"tpr","fpr")

plot(roc1, col="blue", main='M1 - M2 ROC CURVES')
plot(roc2, col="green", add=TRUE)

## Add Legend
legend("bottomright", c("m1", "m2"), lty=1, 
       col = c("blue", "green"), bty="n")

#The higher the AUC, the better the performance of the model at distinguishing
#between the positive and negative classes. 
# Area Under the Curve (AUC)

#---------------------------------------------------------------------------------------------------

library(caret)
confusionMatrix(df$class, df$m1)

table(class,m1>0.5) # assuming threshold to be 0.5

# class FALSE TRUE
# -     TN    FP
# +     FN    TP


# class FALSE TRUE
# -     4     1
# +     2     3

#Precision : TP / (TP+FP)
precision <- 3/(3+1) #0.75

#Recall : TP / (TP+FN)
recall <- 3/(3+2) #0.6

#F Score : (2*Precision*Recall) / (Precision+Recall)
f <- 2*precision*recall/(precision+recall) #0.66


#---------------------------------------------------------------------------------------------------

table(class,m2>0.5) # assuming threshold to be 0.5

# class FALSE TRUE
# -     4     1
# +     4     1


precision2 <- 1/(1+1) #0.5
recall2 <- 1/(1+4)  #0.2
f2 <- 2*precision2*recall2/(precision2+recall2) #0.28

# f1 > f2

#---------------------------------------------------------------------------------------------------

table(class,m1>0.1) # assuming threshold to be 0.1

# class FALSE TRUE
# -     1     4
# +     0     5

#Precision : TP / (TP+FP)
precision <- 5/(5+4) #0.55

#Recall : TP / (TP+FN)
recall <- 5/(5+0) #1

#F Score : (2*Precision*Recall) / (Precision+Recall)
f <- 2*precision*recall/(precision+recall) #0.71
