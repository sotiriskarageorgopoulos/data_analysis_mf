data <- read.delim("C:\\Users\\Kostas\\Dev\\data_analysis_mf\\datasets\\OctopusF.txt")

#Task 1
w <- data$Weight
is.vector(w)
summary(w)
sd(w)

#Task 2
h <- hist(w, xlim=c(40,2400), ylim = c(0, 60), main = "Octopus Histogram", xlab = "Weight")

text(h$mids, h$counts, labels = h$counts, adj = c(0.5, - 0.5))

#Task3
qqnorm(w, main='Normal')
qqline(w)

#confidence interval
mean <- mean(w)
sd <- sd(w)
n <- 240

error <- qnorm(0.975)*sd/sqrt(n)
left <- mean-error
right <- mean+error
