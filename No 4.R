x <- 2
v <- 10

#4a  Fungsi Probabilitas dari Distribusi Chi-Square.
dchisq(x, v)

#4b
hsl <- rchisq(100, df = v)
hsl
hist(hsl, 
     freq = FALSE, 
     xlim = c(0,50), 
     ylim = c(0,0.2))

#4c
##mean
mean <- v
mean
##variance
variance <- 2*v
variance
