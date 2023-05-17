# example with cumsum
x <- 1:50 #x is a sequence from 1 to 50
y <- cumsum(x) # y = 1, 1+2, 1+2+3, 1+2+3+4,....

# Simulation example
# Simulation of counting the number of heads for 100 coin flips
sim <- 1000 # number of simulations
sums <- replicate(1000,0)
for(i in 1:sim){
  vals <- sample(c(0,1),100,replace=TRUE) # create the random values
  sums[i] = sum(vals) # calculate the value of interest
}
hist(sums, breaks = 15) # example of histogram plot with 15 bars

sum(sums==50)/sim # probability of getting exactly 50 out of 100 heads

sum(sums>40)/sim # probability of getting at least 40 heads
