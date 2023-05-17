library(MASS)
var_x <- 1.5
var_y <- 1.5
cor_xy <- 0.75
Sigma <- cbind(c(var_x,cor_xy*sqrt(var_x)*sqrt(var_y)),c(cor_xy*sqrt(var_x)*sqrt(var_y),var_y))
mu <- c(1, 3)
mvr <- mvrnorm(1000000, mu, Sigma)

# Expected value of X
mean(mvr[,1])

# Expected value of Y
mean(mvr[,2])

# Expected value of Y, given that X > 3
cond_y <- c()
for(i in 1:1000000){
  if(mvr[i,1]>3){
    cond_y = append(cond_y, mvr[i,2])
  }
}
mean(cond_y)

# Expected value of Y, given that X = 3
cond_y <- c()
for(i in 1:1000000){
  if(mvr[i,1]> 2.9 && mvr[i,1] < 3.1){
    cond_y = append(cond_y, mvr[i,2])
  }
}
mean(cond_y)
