# Linear Regression
library(MASS)
library(ISLR)

### Simple linear regression
names(Boston)
?Boston

# Here medv is dependent variable, lstat is only 1 predictor
plot(medv~lstat,Boston)

# Fit Linar Regression model
fit1=lm(medv~lstat,data=Boston)
fit1

# Here Coeffiecient is -ve
summary(fit1)

# Fits a line
abline(fit1,col="red")

# List of variables related to model
# such as coefficients, residuals, rank so on.
names(fit1)

# It finds confident interval for the fit
# Condidence interval for each of the coefficients
confint(fit1)

predict(fit1,data.frame(lstat=c(5,10,15)),interval="confidence")

### Multiple linear regression

# Fit model with two variables lstat and age
fit2=lm(medv~lstat+age,data=Boston)

# Now two coefficients lstat and age
# Note: R2 is higher the better
# Age is significant but not as much as lstat
summary(fit2)

# Response-medv and all others as predictor
fit3=lm(medv~.,Boston)
summary(fit3)
par(mfrow=c(2,2))
plot(fit3)

# Nothing on left side of ~ means use same response
# as in previous
# Remove predictors age and indus(not significant)
fit4=update(fit3,~.-age-indus)
summary(fit4)

### Nonlinear terms and Interactions
# Let's watch interaction between lstat and age
fit5=lm(medv~lstat*age,Boston)

# Age is not significant, but in "Interaction" it is
summary(fit5)

# Two commands in R can be put in same line separated by comma
# quadrative fit, squared of lstat and put in Identity matrix
fit6=lm(medv~lstat +I(lstat^2),Boston); summary(fit6)
attach(Boston)

# one chart in one layer
par(mfrow=c(1,1))

plot(medv~lstat)

# Here we need points for quadratic fit(fitted(fit6)) to plot on chart
points(lstat,fitted(fit6),col="red",pch=20)

# Fit medv as polynomial of degree 4 in lstat
fit7=lm(medv~poly(lstat,4))
points(lstat,fitted(fit7),col="blue",pch=20)
plot(1:20,1:20,pch=1:20,cex=2)

###Qualitative predictors

fix(Carseats)
names(Carseats)

# ShelveLoc is a qualitative(Categorical) variable.
summary(Carseats)

# Fit with Response variable Sales vs all
# Interactions are: Income:Advertising, Age:Price
fit1=lm(Sales~.+Income:Advertising+Age:Price,Carseats)

# Here Income:Advertising is significant
# while Age:Price is not
summary(fit1)
contrasts(Carseats$ShelveLoc)

###Writing R functions

regplot=function(x,y){
  fit=lm(y~x)
  plot(x,y)
  abline(fit,col="red")
}
attach(Carseats)

regplot(Price,Sales)

# Here dot dot means unnamed arguments.
regplot=function(x,y,...){
  fit=lm(y~x)
  plot(x,y,...)
  abline(fit,col="red")
}

regplot(Price,Sales,xlab="Price",ylab="Sales",col="blue",pch=20)
