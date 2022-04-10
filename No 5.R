set.seed(1)
library(ggplot2)
theme_set(theme_bw())
lambda <- 3

data <- replicate(1000, mean(rexp(10,lambda)))
data