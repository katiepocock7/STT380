# Markov Chains analysis in R
# find end state by iteration
A <- cbind(c(.7,.3),c(.5,.5))
s0 <- as.matrix(c(.2,.8))
s <- s0
for(i in 1:100){
  s_new <- A %*% s
  if(sum(abs(s-s_new))<0.0001){
    break
  }
  s <- s_new
}
i
s

# find with eigenvalue and eigenvectors
eigen(A)
# eigenvector corresponding to eigenvalue 1 is final state
# possible to have multiple ev's with value 1; final state is mix of those
# have to normalize vector so sum is 1
eigen(A)$vectors[,1] / sum(eigen(A)$vectors[,1])


# finding end states after burn-in
A <- cbind(c(.2,.4,.4),c(0, 0, 1), c(0, 1,0))
x1 <- t(as.matrix(rdirichlet(1,rep(1,3))))
x <- x1
#initial burn-in
for(i in 1:50){
  x <- A %*% x
  print(x)
  }
#collect end-states
y <- matrix(nrow=3, ncol = 50)
for(i in 1:50){
  x <- A%*%x
  y[,i]<- x
}
mean(y[1,])
mean(y[2,])
mean(y[3,])
