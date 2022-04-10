lambda <- 3
#5a
DistExponensial <- function(lambda, x){
  print((1/lambda),exp(x/lambda*-1))
}

#5b
set.seed(1)
N <- 10
y_rexp <- rexp(N, lambda)
hist(y_rexp,breaks = 5, 
     main = "10 data")

N <- 100
y_rexp <- rexp(N, lambda)
hist(y_rexp,breaks = 50, main = "100 data")

N <- 1000
y_rexp <- rexp(N, lambda)
hist(y_rexp, breaks = 500, main = "1000 data")

N <- 10000
y_rexp <- rexp(N, lambda)
hist(y_rexp, breaks = 5000, main = "10000 data")

#5c
mean(rexp(100, lambda))

var(rexp(100, lambda))
