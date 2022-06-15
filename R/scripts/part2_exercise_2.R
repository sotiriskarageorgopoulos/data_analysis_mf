#Koutsoukos

capital <- read.csv("C:\\Users\\Kostas\\Dev\\data_analysis_mf\\datasets\\capital.csv", sep = ";")

#i
prop.table(table(capital$balance, capital$gender))

#i - barplot
gender <- table(capital$gender)
barplot(gender, ylim=c(0,250), ylab = "Balance", xlab = "Gender",
        main = "Balance ~ Gender", col = c('green', '#1F77B4'), legend = TRUE)

#i - pie
pie(gender, main = "Pie balance ~ gender", col = c('green', '#1F77B4'), legend = TRUE)

#ii - boxplots
boxplot(capital, main = 'Boxplot for balance and gender')
boxplot(capital$balance, main="Balance boxplot", ylab="Balance")
boxplot(capital$gender, main="Gender boxplot", ylab="Gender")
boxplot(capital$balance ~ capital$gender, main="Balance ~ Gender boxplot", xlab = "Gender", ylab = "Balance")

#iii
summary(capital)
sd(capital$balance)
sd(capital$gender)

#iv
qqnorm(capital$balance)
qqline(capital$balance)

qqnorm(capital$gender)
qqline(capital$gender)