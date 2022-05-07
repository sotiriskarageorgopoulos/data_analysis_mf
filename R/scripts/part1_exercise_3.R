#Sotirios Karageorgopoulos
A <- c(0,1,0,1,1,0,1,0,0,1)
B <- c(0,0,1,0,0,0,1,0,1,1)
C <- c(1,1,0,0,1,1,0,0,0,1)
class <- c('-','+','-','-','+','+','-','-','+','+')

df <- data.frame(A=A,B=B,C=C,class=class)

table_A_class <- addmargins(table(df$A,df$class))

table_C_class <- addmargins(table(df$C,df$class))

table_B_class <- addmargins(table(df$B,df$class))

table_plus_minus <- addmargins(table(df$class,df$class))

print(table_A_class)
print(table_C_class)
print(table_B_class)
print(table_plus_minus)

p_A_plus <- table_A_class[2,2] / table_A_class[3,2] #P(A,+)
print(p_A_plus)

p_A_minus <- table_A_class[2,1] / table_A_class[3,1] #P(A,-)
print(p_A_minus)

p_B_plus <- table_B_class[2,2] / table_B_class[3,2] #P(B,+)
print(p_B_plus)

p_B_minus <- table_B_class[2,1] / table_B_class[3,1] #P(B,-)
print(p_B_minus)

p_C_plus <- table_C_class[2,2] / table_C_class[3,2] #P(C,+)
print(p_C_plus)

p_C_minus <- table_C_class[2,1] / table_C_class[3,1] #P(C,-)
print(p_C_minus)

p_minus <- table_plus_minus[3,1] / table_plus_minus[3,3]
p_plus <- table_plus_minus[3,2] / table_plus_minus[3,3]
print(p_minus)
print(p_plus)

# P(class='+'/A=1,B=1,C=1)
prob_plus_A_B_C <- p_A_plus * p_B_plus * p_C_plus * p_plus
print(prob_plus_A_B_C)
# P(class='-'/A=1,B=1,C=1)
prob_minus_A_B_C <- p_A_minus * p_B_minus * p_C_minus * p_minus
print(prob_minus_A_B_C)

if(prob_plus_A_B_C > prob_minus_A_B_C) {
    print("The category is '+'...")
}else if(prob_plus_A_B_C < prob_minus_A_B_C) {
    print("The category is '-''...")
}else {
    print("I don't know what category is,
    because P(class='+'/A=1,B=1,C=1) and P(class='-'/A=1,B=1,C=1) are equal...'")
}