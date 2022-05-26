#koutsoukos

id <- c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20)
gender <- c('M','M','M','M','M','M','F','F','F','F','M','M','M','M','F','F','F','F','F','F')
gender <- as.factor(gender)
gender <- unclass(gender)

car <- c('Family','Sports','Sports','Sports','Sports','Sports','Sports','Sports','Sports','Luxury',
         'Family','Family','Family','Luxury','Luxury','Luxury','Luxury','Luxury','Luxury','Luxury')
car <- as.factor(car)
car <- unclass(car)

shirt <- c('Small','Medium','Medium','Large','Extra Large','Extra Large','Small','Small','Medium',
           'Large','Large','Extra Large','Medium','Extra Large','Small','Small','Medium','Medium','Medium','Large')
shirt <- as.factor(shirt)
shirt <- unclass(shirt)

class <- c('C0','C0','C0','C0','C0','C0','C0','C0','C0','C0','C1','C1','C1','C1','C1','C1','C1','C1','C1','C1')
class <- as.factor(class)
class <- unclass(class)

df <- data.frame(ID=id,Gender=gender,Car=car,Shirt=shirt,Class=class)

library(ineq)
Gini(df$ID) #0.317
Gini(df$Gender) #0.167
Gini(df$Car) #0.182

m <- as.matrix(df)
Gini(m) #0.5

# v) gender <- smallest gini
# vi) The attribute cannot be used for prediction (it has no predictive power) since Customer IDs are uniquw.
