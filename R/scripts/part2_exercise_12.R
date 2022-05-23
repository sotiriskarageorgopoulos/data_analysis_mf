#koutsoukos

install.packages("dbscan")

y <- c(5,6,8,7,6,5,3,2,8,7,5,3,8,6,4,7,6,5,4,4,3,5,2)
x <- c(1,2,3,3,3,3,3,3,4,4,4,4,5,5,5,6,6,6,6,7,8,9,9)

plot(x,y, main = " X and Y plot")
library("dbscan")
m <- cbind(x,y)
df <- as.data.frame(m)

dbscan_res <- dbscan(df, eps = 1, minPts = 3)
plot(df, col=dbscan_res$cluster+1, main="DBSCAN", pch = 19)

# a -> cat1, b -> cat2, c -> cat3 

#Elbow Method for finding the optimal number of clusters
set.seed(123)
# Compute and plot wss for k = 2 to k = 15.
k.max <- 15

wss <- sapply(1:k.max, 
              function(k){kmeans(df, k, nstart=50,iter.max = 15 )$tot.withinss})
wss
plot(1:k.max, wss,
     type="b", pch = 19, frame = FALSE, 
     xlab="Number of clusters K",
     ylab="Total within-clusters sum of squares")

kmeans(df,3)
