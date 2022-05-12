decathlon <- read.table("C:\\Users\\Kostas\\Dev\\data_analysis_mf\\datasets\\decathlon.csv",
                        header=TRUE, sep=";",dec=".", row.names=1, check.names=FALSE)

summary(decathlon)
library(FactoMineR)

res <- PCA(decathlon, quanti.sup=11:12, quali.sup=13, ncp=Inf)
res <- PCA(decathlon, quanti.sup=11:12, quali.sup=13, ncp=8, graph=FALSE)

res.hcpc <- HCPC(res, kk=Inf, min=3, max=10, consol=TRUE)
