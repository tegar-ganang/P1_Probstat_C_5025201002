n <- 100
m <- 50
sd <- 8

#6a
set.seed(100)
rand <- rnorm(100)
rata2 <- mean(rand)

x1 <- floor(rata2)
x2 <- ceiling(rata2)
x1
x2

z1 <- (x1 - m) / sd
z2 <- (x2 - m) / sd
z1
z2

rnorm(n, m, sd)
plot(rnorm(n, m, sd))

#b
hist(rnorm(n, m, sd), xlab = "x", ylab = "y", breaks = 50, main = "5025201002_Tegar Ganang Satrio Priambodo_Probstat_C_DNhistogram")

#c
varian <- sd**2
varian
