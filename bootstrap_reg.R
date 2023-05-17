library(MASS)
library(DirichletReg)
diam_mod <- lm(data = diamonds, price ~ carat)
summary(diam_mod)
coeff1 <- rep(0, 100)
coeff2 <- rep(0, 100)
weight <- rep(0,length(diamonds$carat))
for(i in 1:100){
  n <- length(diamonds$carat)
  # weight <- rdirichlet(1, rep(1,n))
  row_samp <- sample(1:n, n, replace = TRUE)
  diam_samp <- diamonds[row_samp,]
  temp_mod <- lm(data = diam_samp, price ~ carat)
  coeff1[i] <- temp_mod$coefficients[1]
  coeff2[i] <- temp_mod$coefficients[2]
}
quantile(coeff1, c(0.025, 0.975))
quantile(coeff2, c(0.025, 0.975))
plot(seq(0, 3, by = 0.05), coeff1[1]+seq(0, 3, by = 0.05)*coeff2[1], type = 'l')
for(i in 2:100){
  lines(seq(0, 3, by = 0.05), coeff1[i]+seq(0, 3, by = 0.05)*coeff2[i])
}

diam_mod <- lm(data = iris, Petal.Length ~ Petal.Width)
summary(diam_mod)

# bootstrap regression with iris
coeff1 <- rep(0, 1000)
coeff2 <- rep(0, 1000)
n <- length(iris$sepal.length)
weight <- rep(0,n)
for(i in 1:1000){
  weight <- rdirichlet(1, rep(1,n))
  row_samp <- sample(1:n, n, prob = weight, replace = TRUE)
  iris_samp <- iris[row_samp,]
  temp_mod <- lm(data = iris_samp, petal.length ~ petal.width)
  coeff1[i] <- temp_mod$coefficients[1]
  coeff2[i] <- temp_mod$coefficients[2]
}
quantile(coeff1, c(0.025, 0.975))
quantile(coeff2, c(0.025, 0.975))
plot(seq(0, 3, by = 0.05), coeff1[1]+seq(0, 3, by = 0.05)*coeff2[1], type = 'l')
for(i in 2:100){
  lines(seq(0, 3, by = 0.05), coeff1[i]+seq(0, 3, by = 0.05)*coeff2[i])
}