library('rpart')
data("kyphosis")
kyph <- kyphosis
boxplot(kyph$Number)
outliers <- boxplot.stats(kyphosis$Number)$out
print(outliers)
outliers_indexes <- which(kyphosis$Number %in% c(outliers))
print(outliers_indexes) #outliers indexes from boxplot

#identify outliers on the boxplot
identify(rep(1, length(outliers)),outliers,labels = seq_along(outliers))