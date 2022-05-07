library("psych")
insurance <- read.csv("C:\\Users\\sotir\\Dev\\data_analysis_mf\\datasets\\insurance.csv")

important_features <- insurance[c("age", "bmi", "children", "charges")]
print(cor(important_features))
pairs.panels(important_features)

#because there is no strong correlation between the features
mult_linear_model <- lm(charges ~ ., data = insurance)
# charges = -11938.5 + 256.9*age - 131.3*sexmale + 339.2*bmi + 475.5*children + 23848.5smokeryes - 353*regionnorthwest - 1035*regionsoutheast - 960*regionsouthwest 
print(summary(mult_linear_model)) 