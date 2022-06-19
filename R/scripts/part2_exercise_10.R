#koutsoukos

library(readxl)
mf <- read_excel("C:\\Users\\Kostas\\Dev\\data_analysis_mf\\datasets\\mf.xls")

#contingency table
table(mf$`Dollar Claim Amount`, mf$Shift)
table(mf$`Dollar Claim Amount`, mf$`Complaint Code`)
table(mf$`Dollar Claim Amount`, mf$`Manufacturing Plant`)
table(mf$`Dollar Claim Amount`, mf$Shift)
table(mf$`Complaint Code`, mf$Shift)
table(mf$`Complaint Code`, mf$`Manufacturing Plant`)

#ii
contigency_table <- table(mf$`Complaint Code`, mf$`Manufacturing Plant`)
results <- chisq.test(contigency_table)
round(results$expected)

#iii
boise <- mf[(mf$`Manufacturing Plant` == 1),]$`Dollar Claim Amount`
salt <- mf[(mf$`Manufacturing Plant` == 2),]$`Dollar Claim Amount`
t.test(boise, salt, conf.level = 0.98)
