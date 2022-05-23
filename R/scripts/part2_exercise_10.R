#koutsoukos

library(readxl)
mf <- read_excel("C:\\Users\\Kostas\\Dev\\data_analysis_mf\\datasets\\mf.xls")

#contingency table
table(mf$`Dollar Claim Amount`, mf$Shift)


#ii
contigency_table <- table(mf$`Complaint Code`, mf$`Manufacturing Plant`)
results <- chisq.test(contigency_table)
round(results$expected)

#iii
boise <- mf[(mf$`Manufacturing Plant` == 1),]$`Dollar Claim Amount`
salt <- mf[(mf$`Manufacturing Plant` == 2),]$`Dollar Claim Amount`
t.test(boise, salt, conf.level = 0.98)
