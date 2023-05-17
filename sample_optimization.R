# Single-variable optimization

f <- function(x) x^2 - 4* x - 2

plot(seq(-10,10, by = 0.1), f(seq(-10,10, by = 0.1)))
optimize(f, c(-10,10), maximum = TRUE)

fa <- function(x) abs(x)
optimize(fa, c(-2,2))

#3-d plot of z = x^2 + y^2 - 3x
fm <- function(x) x[1]^2 + x[2]^2 - 3 * x[1]
x_min <- -5
x_max <- 5
y_min <- -5
y_max <- 5
x <- seq(-5, 5, by = 0.05)
y <- seq(-5, 5, by = 0.05)
z <- matrix(nrow=length(x), ncol=length(y))
for(i in 1:length(x)){
  for(j in 1:length(y)){
    z[i,j] <- fm(c(x[i],y[j])) +rnorm(1,0,2)
  }
}
contour(x,y,z)

# Multi-variable optimization
optim(c(-4,4),fm)

