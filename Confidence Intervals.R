# 95% 2-sided CI for iris sepal width
mn <- mean(iris$Sepal.Width)
sdev <- sd(iris$Sepal.Width)
n <- length(iris$Sepal.Width)
serror <- sdev/sqrt(n)
CI <- mn + serror*qt(c(0.025,0.975), length(iris$Sepal.Width) - 1)
CI

# 99% 1-sided upper CL for iris sepal width
UCL <- mn + serror*qt(0.99, length(iris$Sepal.Width) - 1)
UCL
