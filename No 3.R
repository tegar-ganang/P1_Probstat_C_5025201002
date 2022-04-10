lambda <- 4.5
x <- 6
n <- 365
p <- 0.5
set.seed(365)
#3a
dpois(x, lambda)

#3b
dpois(x, lambda = p*n) #kurang histogram
hist(dpois(x, lambda = p*n), xlab = "probabilitas", ylab = "hari", main = "Poisson Histogram")
#3c
summary(dpois(x, lambda))
summary(dpois(x, lambda = p*n))
#3d
rataan <- varian <- lambda
