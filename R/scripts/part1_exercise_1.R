#Sotirios Karageorgopoulos

cosine_similarity <- function (x,y) {
    sum_numerator <- 0
    sumX_square <- 0
    sumY_square <- 0

    for(i in 1:length(x)) {
        sum_numerator <- sum_numerator + x[i]*y[i]
        sumX_square <- sumX_square + x[i]**2
        sumY_square <- sumY_square + y[i]**2
    }

    return (sum_numerator / sqrt(sumX_square)*sqrt(sumY_square))
}

pearson_correlation <- function(x,y) {
    sum_x <- 0
    sum_y <- 0
    sum_x_y_m <- 0
    sum_x_m_square <- 0
    sum_y_m_square <- 0 
    n <- length(x) #number of data in vector

    for(i in 1:n) {
       sum_x <- sum_x + x[i]
       sum_y <- sum_y + y[i]
    }

    x_mean <- sum_x / n
    y_mean <- sum_y / n

    for(i in 1:n) {
        sum_x_y_m <- sum_x_y_m + ((x[i] - x_mean)*(y[i] - y_mean))
        sum_x_m_square <- sum_x_m_square + (x[i] - x_mean)**2
        sum_y_m_square <- sum_y_m_square + (y[i] - y_mean)**2
    }
    r_x_y = sum_x_y_m / sqrt(sum_x_m_square) * sqrt(sum_y_m_square)

    return (r_x_y)
}

euclidean_distance <- function(x,y) {
   sum <- 0

   for(i in 1:length(x)) {
       sum <- sum + (x[i] - y[i])**2
    }

   return (sqrt(sum))
}

jaccard_distance <- function(x,y) {
    m_1_1 <- 0
    m_0_1 <- 0
    m_1_0 <- 0 

    for(i in 1:length(x)) {
        if(x[i] == y[i]) {
            m_1_1 <- m_1_1 + 1
        } else {
            m_0_1 <- m_0_1 + 1
            m_1_0 <- m_1_0 + 1
        }
    }
    
    j_coefficient <- m_1_1 / (m_0_1 + m_1_0 + m_1_1)

    return (1 - j_coefficient)
}

x1 <- c(0,1,0,1)
y1 <- c(1,0,1,0)

print(cosine_similarity(x1,y1))
print(pearson_correlation(x1,y1))
print(euclidean_distance(x1,y1))
print(jaccard_distance(x1,y1))

x2 <- c(0,-1,0,1)
y2 <- c(1,0,-1,0)

print(cosine_similarity(x2,y2))
print(pearson_correlation(x2,y2))
print(euclidean_distance(x2,y2))