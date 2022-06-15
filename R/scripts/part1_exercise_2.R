#koutsoukos

id <- c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20)
gender <- c('M','M','M','M','M','M','F','F','F','F','M','M','M','M','F','F','F','F','F','F')


car <- c('Family','Sports','Sports','Sports','Sports','Sports','Sports','Sports','Sports','Luxury',
         'Family','Family','Family','Luxury','Luxury','Luxury','Luxury','Luxury','Luxury','Luxury')


shirt <- c('Small','Medium','Medium','Large','Extra Large','Extra Large','Small','Small','Medium',
           'Large','Large','Extra Large','Medium','Extra Large','Small','Small','Medium','Medium','Medium','Large')


class <- c('C0','C0','C0','C0','C0','C0','C0','C0','C0','C0','C1','C1','C1','C1','C1','C1','C1','C1','C1','C1')


df <- data.frame(ID=id,Gender=gender,Car=car,Shirt=shirt,Class=class)
c0 <- df[1:10, ] 
c1 <- df[11:20,]

#The Gini index is 1 minus the sum of the fraction of records belonging to i at a given node t.
#ii
Gini.ID = 0
for (i in 1: 20)
{
  Gini.i <- 1 - (1/1)^2 - (0/1)^2
  Gini.ID = Gini.ID + Gini.i
}
Gini.ID


#iii
genderFreq <- table(df$Gender)
gendec0rFreq <- table(c0$Gender)
genderc1Freq <- table(c1$Gender)

Gini.Male <- 1 - (gendec0rFreq[2]/genderFreq[2])^2 -(genderc1Freq[2]/genderFreq[2])^2
Gini.Female <- 1- (4/10)^2 - (6/10)^2
Gini.Gender <- (10/20)*0.48 + (10/20)*0.48

#iv
table(df$Car)
table(c0$Car)
table(c1$Car)
Gini.Family <- 1- (1/4)^2 - (3/4)^2
Gini.Sports <- 1- (8/8)^2 - (0/8)^2
Gini.Luxury <- 1- (1/8)^2 - (7/8)^2
Gini.Car <- (4/20)*Gini.Family + (8/20)*Gini.Sports + (8/20)*Gini.Luxury

# v) car <- smallest gini
# vi) The attribute cannot be used for prediction (it has no predictive power) since Customer IDs are unique.
