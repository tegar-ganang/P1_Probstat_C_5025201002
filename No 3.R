lambda <- 4.5
x <- 6
n <- 365
p <- 0.5
set.seed(365)
#3a
dpois(x, lambda)

#3b
rpois(n, lambda) #kurang histogram
hist(rpois(n, lambda), xlab = "probabilitas", ylab = "hari", main = "Poisson Histogram")
#3c
summary(dpois(x, lambda))
summary(rpois(n, lambda))
#3d
rataan <- varian <- lambda
rataan
varian
