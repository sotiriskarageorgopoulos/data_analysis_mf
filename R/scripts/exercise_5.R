library('MASS')
data("survey")
s <- survey
ex = survey$Exer %in% c("Freq", "Some")
contigency_table <- table(smoke=survey$Smoke,exercise=ex)
results <- chisq.test(contigency_table)
statistic_value = sum(results$residuals^2) #(observed - expected) / sqrt(expected) -> (observed - expected) ^ 2 / expected
chi_test_value = results$statistic
print(results$observed) #contigency table
print(results$expected)

if(statistic_value <= chi_test_value) {
    print("The test was accepted!")
    print(statistic_value)
    print(chi_test_value)
} else {
    print("The test was rejected!")
    print(statistic_value)
    print(chi_test_value)
}