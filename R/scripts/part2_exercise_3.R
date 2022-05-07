mtcars <- read.table("C:\\Users\\sotir\\Dev\\data_analysis_mf\\datasets\\mtcars.csv",sep=",",header=TRUE)
automatic_transmission <- mtcars[(mtcars$am == 0),]$mpg
manual_transmission <- mtcars[(mtcars$am == 1),]$mpg

#The difference is 24.39231-17.14737=7.24494. There is a mean mpg difference 7.24494 between cars with automatic transmissions and cars with manual transmissions.
print(t.test(automatic_transmission,manual_transmission,conf.level=0.95))
