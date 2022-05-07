#Sotirios Karageorgopoulos
x <- c(0.4005,0.2148,0.3457,0.2652,0.0789,0.4548)
y <- c(0.5306,0.3854,0.3156,0.1875,0.4139,0.3022)

df <- data.frame(x,y)
euclidean_distance = dist(df,method="euclidean")

par(mfrow=c(1,2))
simple_linkage <- hclust(euclidean_distance,method="single")
plot(simple_linkage,main="Simple Linkage Dendogram")
complete_linkage <- hclust(euclidean_distance,method="complete")
plot(complete_linkage,main="Complete Linkage Dendogram")