cider <- read.csv("C:\\Users\\sotir\\Dev\\data_analysis_mf\\datasets\\cider.csv")
important_features <- c("Sweetness","Acid","Bitterness","Astringent")
print(cor(cider[important_features]))

par(mfrow=c(2,2))
model_bitterness_astringent <- lm(cider$Astringent ~ cider$Bitterness, data=cider)
plot(cider$Bitterness,cider$Astringent,pch = 21,bg="red",ylab="Astringent",xlab="Bitterness",main="Astringent-Bitterness")
abline(model_bitterness_astringent,col="blue")

model_sweetness_bitterness <- lm(cider$Sweetness ~ cider$Bitterness, data=cider)
plot(cider$Bitterness,cider$Sweetness,pch = 21,bg="red",ylab="Sweetness",xlab="Bitterness",main="Sweetness-Bitterness")
abline(model_sweetness_bitterness,col="blue")

model_sweetness_astringment <- lm(cider$Astringent ~ cider$Sweetness, data=cider)
plot(cider$Sweetness,cider$Astringent,pch = 21,bg="red",ylab="Astringent",xlab="Sweetness",main="Astringent-Sweetness")
abline(model_sweetness_astringment,col="blue")

model_bitterness_acid <- lm(cider$Acid ~ cider$Bitterness, data=cider)
plot(cider$Bitterness,cider$Acid,pch = 21,bg="red",ylab="Acid",xlab="Bitterness",main="Acid-Bitterness")
abline(model_bitterness_acid,col="blue")


