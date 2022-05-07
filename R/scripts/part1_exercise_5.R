#Sotirios Karageorgopoulos
#It is a cluster of 11 points, so we want to prove that formulas are equal
calc_centroid <- function(x,y) {
    sum_x <- 0
    sum_y <- 0

    for(i in 1:length(x)) {
        sum_x <- sum_x + x[i]
    }

    for(i in 1:length(y)) {
        sum_y <- sum_y + y[i]
    }

    x_centroid <- sum_x / length(x)
    y_centroid <- sum_y / length(y)

    return (c(x_centroid,y_centroid))
}

calc_sse_distance_from_centroid <- function(centroid,x,y) {
    sse <- 0

    for(i in 1:length(x)) {
        sse <- sse + (x[i]-centroid[1])**2 + (y[i]-centroid[2])**2 #euclidean distance ^ 2
    }

    return (sse)
}

calc_sse_distance_between_points <- function(x,y) {
    sum <- 0
    m <- length(x)
    for(i in 1:m) {
        for(j in 1:m) {
            sum <- sum + (x[i]-x[j])**2 + (y[i]-y[j])**2 #euclidean distance ^ 2
        }
    }
    return ((1/(2*m)) * sum)
}

x <- seq(0,10,1)
y <- seq(0,100,10)
centroid <- calc_centroid(x,y)
print(centroid)

sse_centroid <- calc_sse_distance_from_centroid(centroid,x,y)
print(sse_centroid)

sse_between_points <- calc_sse_distance_between_points(x,y)
print(sse_between_points)

if(sse_centroid == sse_between_points) {
    print("It is proved that formulas are equal...")
}