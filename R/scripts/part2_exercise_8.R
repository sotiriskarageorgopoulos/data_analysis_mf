#koutsoukos

library(readxl)
market <- read_excel("C:\\Users\\Kostas\\Dev\\data_analysis_mf\\datasets\\market.xlsx")

#i
model <- lm(Sales ~ Preis + Costs + Arrivals , data = market)
summary(model)

summary(model)$coefficient

#ii
modelCosts <- lm(Sales ~ Preis, data = market)
summary(modelCosts)

modelArrivals <- lm(Sales ~ Arrivals, data = market)
summary(modelArrivals)

modelPrice <- lm(Sales ~ Costs, data = market)
summary(modelPrice)

#iii
cordata <- market[c("Sales","Preis","Costs","Arrivals")]
corr <- round(cor(cordata), 1)

library(ggcorrplot)
ggcorrplot(corr, hc.order = TRUE, type = "lower", lab = TRUE, lab_size = 4,
           method="circle", colors = c("blue", "white", "red"), outline.color = "gray",
           show.legend = TRUE, show.diag = FALSE, title="Correlogram of Sales variables")

#iv
standard_res <- rstandard(model)
summary(standard_res)

plot(market$Sales, standard_res, xlab='Sales', ylab='Standardized Residuals')
#add horizontal line at 0
abline(0, 0)
