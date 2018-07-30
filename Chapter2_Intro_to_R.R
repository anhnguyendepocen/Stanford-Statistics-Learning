x = c(2, 7, 5)
y = seq(from=4, length=3, by=3)

?seq
y
x+y
x/y
x*y
x^y
x[2]
x[2:3]
x[-2]
x[-c(1,2)]
z = matrix(seq(1,12), 4, 3)
z
# Thid and fourth row, second and third column
z[3:4, 2:3]

# Get columns
z[, 2:3]

# Get first column
z[,1]
z[,1, drop=FALSE]
z
# Get dimension of matrix
dim(z)

# List what variables are in evironment right now.
ls()

# Remove variable in evironment
rm(y)

ls()

# Generating random uniforms
x = runif(50)
x

# Generate random norm variables
y = rnorm(50)
y
plot(x,y)

plot(x, y, xlab="Random Uniform", ylab="Random normal", pch="*", col="blue")

# Plot two graphs with (2, 1) dimension
par(mfrow=c(2,1))
plot(x,y)

hist(y)
par(mfrow=c(1,1))

# Reading the data
Auto = read.csv("D:/surinder/ds/R/StatLearning/Auto.csv")

# column names
names(Auto)

# dimension of data
dim(Auto)

# type/class of data
class(Auto)

# summary of each of variable in dataframe
summary(Auto)

plot(Auto$cylinders, Auto$mpg)

attach(Auto)
search()
plot(cylinders, mpg)
