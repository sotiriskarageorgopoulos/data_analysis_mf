#koutsoukos

library(readxl)
concrete <- read_excel("C:\\Users\\Kostas\\Dev\\data_analysis_mf\\datasets\\Concrete_Data.xls")

#Normalize concrete data
normalize <- function(x) { 
  return((x - min(x)) / (max(x) - min(x)))
}

concrete_norm <- as.data.frame(lapply(concrete, normalize))

# Confirm that the range is now between zero and one:
summary(concrete_norm$Concrete)

# Create training and test data:
concrete_train <- concrete_norm[1:773, ]
concrete_test <- concrete_norm[774:1030, ]

# Train the neuralnet model:
library(neuralnet)

# Simple ANN with only a single hidden neuron:
set.seed(12345) # to guarantee repeatable results
concrete_model <- neuralnet(formula = Concrete ~ Cement + Slag + Ash + Water + Superplasticizer + 
                              CoarseAggregate + FineAggregate + Age, data = concrete_train)

plot(concrete_model) # multi-layer with a single node 
model_results <- compute(concrete_model, concrete_test[1:8]) # compute
model_results2 <- predict(concrete_model, concrete_test[1:8]) # predict

predicted_strength <- model_results$net.result
cor(predicted_strength, concrete_test$Concrete)

head(predicted_strength)

concrete_train_original_strength <- concrete[1:773,"Concrete"]
strength_min <- min(concrete_train_original_strength)
strength_max <- max(concrete_train_original_strength)
head(concrete_train_original_strength)


unnormalize <- function(x, min, max) { 
  return( (max - min)*x + min )
}
strength_pred <- unnormalize(predicted_strength, strength_min, strength_max)
strength_pred


#A more complex neural network topology with 5 hidden neurons:
set.seed(12345) # to guarantee repeatable results
concrete_model2 <- neuralnet(Concrete ~ Cement + Slag + Ash + Water + Superplasticizer + 
                               CoarseAggregate + FineAggregate + Age,
                             data = concrete_train, hidden = 5)

plot(concrete_model2)

#Evaluate with compute
model_results2 <- compute(concrete_model2, concrete_test[1:8])
predicted_strength2 <- model_results2$net.result
cor(predicted_strength2, concrete_test$Concrete)

head(predicted_strength2)

concrete_train_original_strength <- concrete[1:773,"Concrete"]
strength_min <- min(concrete_train_original_strength)
strength_max <- max(concrete_train_original_strength)
head(concrete_train_original_strength)


unnormalize <- function(x, min, max) { 
  return( (max - min)*x + min )
}
strength_pred <- unnormalize(predicted_strength, strength_min, strength_max)
strength_pred


