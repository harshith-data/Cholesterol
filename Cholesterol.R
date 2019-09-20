#Estimating cholesterol with help of age, sex and other vitals by Harshith.

# 1. Loading Data in R
# Set working directory and read the data
setwd("C:/Users/Harshith/Desktop/DataScience/Data")
#Read the data into a data frame
cholesterol <- read.csv("cholesterol.csv")
head(cholesterol)

# 2. Split the data into training and test set
set.seed(1234)
ind <- sample(2, nrow(cholesterol), replace = TRUE, prob = c(0.7, 0.3))
train.chol <- cholesterol[ind == 1, ]
test.chol <- cholesterol[ind == 2, ]

# 3. Run the method on a training data
myFormula<-chol~.
model<-lm(myFormula, data=train.chol)
print(model)
summary(model)

# 4. Evaluate the model on test data
pred <- predict(model,  newdata=test.chol)
plot(test.chol$chol, pred, xlab = "Observed", ylab = "Prediction")
abline(a = 0, b = 1)
plot (model)

# 5. Minimal adequate model
Model2<-step(model, direction="backward")
summary(Model2)

