decathlon <- read.table("C:\\Users\\Kostas\\Dev\\data_analysis_mf\\datasets\\decathlon.csv",
                        header=TRUE, sep=";",dec=".", row.names=1, check.names=FALSE)

summary(decathlon)
library(FactoMineR)

#res <- PCA(decathlon, quanti.sup=11:12, quali.sup=13, ncp=Inf)
res <- PCA(decathlon, quanti.sup=11:12, quali.sup=13, ncp=8, graph=FALSE)

decathlon.hcpc <- HCPC(decathlon, kk=Inf, min=3, max=10, consol=TRUE)

res.hcpc <- HCPC(res, kk=Inf, min=3, max=10, consol=TRUE)


#kmeans

clean = scale(decathlon[,1:10])

results <- kmeans(res$var$coord[,1:2], centers=4)
results

plot(results, col = results$cluster)
plot(decathlon,col=results$cluster, pch = 19,  main = " X and Y plot after kmeans")

library(factoextra)
k2 <- kmeans(clean, centers = 5, nstart = 25)
fviz_cluster(k2, data = clean)
