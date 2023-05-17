x <- seq(0,1, by = 0.01)
alpha <- 2
beta <- 2
y <- dbeta(x,alpha,beta)
plot(x,y, ylim = c(0,5), type="l")


games <- 21
wins <- 15
alpha_post <- alpha + wins
beta_post <- beta + games - wins
y_post <-dbeta(x,alpha_post,beta_post)


lines(x,y_post,col="red")
print(qbeta(0.025,alpha,beta))
print(qbeta(0.975,alpha,beta))
print(qbeta(0.025,alpha_post,beta_post))
print(qbeta(0.975,alpha_post,beta_post))