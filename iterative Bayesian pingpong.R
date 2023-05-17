# update one at a time
theta <- c(seq(0,1, by = 0.1))
prior <- c(0,0.02,0.03,0.05,0.10,0.15,0.20,0.25,0.15,0.05,0)
colors <- c("red", "orange", "green", "blue", "purple")
n <- 5
win <- 2
plot(theta,prior,ylim=c(0,1))
results <- c(rep(1,win), rep(0,n - win))
result <- sample(results, length(results))
result
for (i in 1:length(result)){
  upd <- prior * theta^result[i]*(1-theta)^(1-result[i])
  normalize <- sum(upd)
  posterior <- upd/normalize
  prior <- posterior
  lines(theta,posterior, col = colors[i])  
  }

# update all together
theta <- c(seq(0,1, by = 0.1))
prior <- c(0,0.02,0.03,0.05,0.10,0.15,0.20,0.25,0.15,0.05,0)
n <- 5
win <- 2
posterior2 <- prior*dbinom(win,n,theta)/sum(prior*dbinom(win,n,theta))
posterior2
posterior

sum(theta*prior)
sum(theta*posterior) #expected value


#discretization example
# prior probability is proportional to p(1-p)
# grid of 10 entries
theta <- seq(0.05,0.95, by = 0.1)
prior <- theta*(1-theta)/sum(theta*(1-theta))
plot(theta,prior,ylim=c(0,1))
# play 12, win 4
n <- 12
wins <- 4
posterior_12 <- prior*dbinom(wins,n,theta)/sum(prior*dbinom(wins,n,theta))
lines(theta,posterior_12)