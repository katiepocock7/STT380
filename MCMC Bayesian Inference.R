
library(rstan)
library(bayesplot)
library(dplyr)
library(StanHeaders)

# Code wrapper for rstan 
beta.binom.model <- "
data {
int<lower = 0, upper = 14> X;
}
parameters {
real<lower = 0, upper = 1> theta;
}
model {
X ~ binomial(14, theta);
theta ~ beta(2, 2); 
}
"
options(width=60)
sim.posterior <- stan(model_code = beta.binom.model,
                      data = list(X = 9),
                      chains = 4,
                      iter = 5000*2,
                      seed=12345)

##
## Attaching package: 'dplyr'
## The following object is masked from 'package:kableExtra':
##
## group_rows
## The following objects are masked from 'package:stats':
##
## filter, lag
## The following objects are masked from 'package:base':
##
## intersect, setdiff, setequal, union
round(as.array(sim.posterior, pars = "theta"),4) %>%
  head(6)

mcmc_trace(sim.posterior,pars = "theta", size= 0.1)

mcmc_dens(sim.posterior, pars = "theta") +
  yaxis_text(TRUE) +
  ylab("density") +
  stat_function(fun = function(x) dbeta(x, 11, 7),
                col = "black",size = 2)

