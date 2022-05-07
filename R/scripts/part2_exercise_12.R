install.packages("dbscan")

y <- c(5,6,8,7,6,5,3,2,8,7,5,3,8,6,4,7,6,5,4,4,3,5,2)
x <- c(1,2,3,3,3,3,3,3,4,4,4,4,5,5,5,6,6,6,6,7,8,9,9)

plot(x,y)
library("dbscan")
m <- cbind(x,y)

dbscan_res <- dbscan(m, eps = 1, minPts = 3)
plot(m, col=dbscan_res$cluster+1, main="DBSCAN", pch = 19)

# a -> cat1, b -> cat2, c -> cat3 