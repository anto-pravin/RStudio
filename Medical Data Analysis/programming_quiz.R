if(!require("pacman")) install.packages("pacman",depends=T)
pacman::p_load(pacman,rio,psych)

#TASK 1
# Importing the csv files
tr_data <- import("F:/Assessment/Pima.tr.csv")
te_data <- import("F:/Assessment/Pima.te.csv")

head(tr_data)
head(te_data)

#Task 2
#Basic statistical Details
describe(tr_data)
describe(te_data)

summary(tr_data)
summary(te_data)

#Task 3
#par(mfrow = c(3,1)) #uncomment the line for viewing all the three distributions in the same window

#Distribution of Blood Pressure
hist(tr_data$bp,
     breaks = 15,
     col = 'dark red',
     main = 'Distribution of Blood Pressure',
     xlab = 'Blood Pressure')

#Distribution of Skin Thickness
hist(tr_data$skin,
     breaks = 15,
     col = 'dark blue',
     main = 'Distribution of Skin Thickness',
     xlab = 'Skin Thickness')

#Distribution of BMI
hist(tr_data$bmi,
     breaks = 15,
     col = 'dark green',
     main = 'Distribution of BMI',
     xlab = 'BMI')

par(mfrow = c(1,1))

#Task 4
# a) Insulin value not provided in the data set

# b) Glucose and Age
plot(tr_data$age,tr_data$glu,
     xlab = "Age",
     ylab = "Glucose",
     main = "Glucose Vs Age",
     col = "dark red",
     lwd = 3,
     type = "h"
     )

#Pregnancies Vs Age
plot(tr_data$npreg,tr_data$age,
     main = "Pregnancy Vs Age",
     xlab = "Pregnancy",
     ylab = "Age",
     col = 'dark red',
     pch = 20,
     cex = 1.5,
     )

#Task 5
#Dimentionality Reduction to 5 Features
(Dimentionality_reduced <- tr_data[c(3,4,6,7,8)])

#Task 6
#Logical Regression Model to prediction 

X <- Dimentionality_reduced[,c('glu','bp','bmi','age','ped')]

?glm.fit()

log_model <- glm.fit(Dimentionality_reduced[,-4],Dimentionality_reduced[,4])

#Prediction
pred_mod <- glm(formula = ped ~ glu + bp + bmi + age, data = X)
predict(pred_mod,te_data)



# Unloading packages and clearing the workspace
rm(list = ls()) 

p_unload(all) 

dev.off()  

cat("\014")
