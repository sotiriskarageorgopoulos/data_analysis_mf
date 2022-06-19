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

#i
totalFreq <- addmargins(t(table(df$Class)))
Gini.Total <- 1 - (totalFreq[1,1]/totalFreq[1,3])^2 - (totalFreq[1,2]/totalFreq[1,3])^2

#ii
IDFreq <- addmargins(t(table(df$ID)))

Gini.ID = 0
for (i in 1: 20)
{
  Gini.i <- 1 - (IDFreq[1,i]/IDFreq[1,i])^2 - (0/IDFreq[1,i])^2
  Gini.ID = Gini.ID + Gini.i
}
Gini.ID


#iii
genderFreq <- addmargins(t(table(df$Gender)))
genderc0Freq <- addmargins(t(table(c0$Gender)))
genderc1Freq <- addmargins(t(table(c1$Gender)))

Gini.Male <- 1 - (genderc0Freq[1,2]/genderFreq[1,2])^2 - (genderc1Freq[1,2]/genderFreq[1,2])^2
Gini.Female <- 1- (genderc0Freq[1,1]/genderFreq[1,1])^2 - (genderc1Freq[1,1]/genderFreq[1,1])^2
Gini.Gender <- (genderFreq[2]/genderFreq[1,3])*Gini.Male + (genderFreq[1,1]/genderFreq[1,3])*Gini.Female

#iv
CarFreq <- addmargins(t(table(df$Car)))
Carc0Freq <- addmargins(t(table(c0$Car)))
Carc1Freq <- addmargins(t(table(c1$Car)))

Gini.Family <- 1- (Carc0Freq[1,1]/CarFreq[1,1])^2 - (Carc1Freq[1,1]/CarFreq[1,1])^2
Gini.Sports <- 1- (Carc0Freq[1,3]/CarFreq[1,3])^2
Gini.Luxury <- 1- (Carc0Freq[1,2]/CarFreq[1,2])^2 - (Carc1Freq[1,2]/CarFreq[1,2])^2
Gini.Car <- (CarFreq[1,1]/CarFreq[1,4])*Gini.Family + (CarFreq[1,3]/CarFreq[1,4])*Gini.Sports + (CarFreq[1,2]/CarFreq[1,4])*Gini.Luxury

# v) car <- smallest gini
# vi) The attribute cannot be used for prediction (it has no predictive power) since Customer IDs are unique.
