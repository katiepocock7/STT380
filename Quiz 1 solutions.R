# 1
sample(1:8,6, replace=TRUE)
# example output: 1 3 3 1 6 2

#2 
0.34/(0.34+0.21)
# answer is 0.6186

#3 
# Sample space is 0, 1, 2, 3, 4, 5, 6
# P(1) = 1/6 * 1/2 = 1/12

#4 (a) Table is a cdf.  Reason can be either (last result is a 1) or 
# (sum of values is not 1)
# (b) answer is 0.3.  Or  construct the pmf and get the answer that way
# or take difference of cdf(3) - cdf(1)

#5(a)
dbinom(2,4,0.3)
# answer is 0.2646
#(b)
1 - pbinom(1,10,0.3)
# answer is 0.85069