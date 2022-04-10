lambda <- 4.5
x <- 6
n <- 365
p <- 0.5
set.seed(365)
#3a
dpois(x, lambda)

#3b
dpois(x, lambda = p*n) #kurang histogram

#3c

#3d
mean(dpois(x, lambda))
mean(dpois(x, lambda = p*n))

var(dpois(x, lambda))
var(dpois(x, lambda = p*n))
