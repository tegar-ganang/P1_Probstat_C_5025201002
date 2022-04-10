#2a
p <- 0.2 #peluang sembuh
n <- 20 #psien covid
q <- (1 - p)
x <- 4

dbinom(x,size = n,p)

#2b
library(dplyr)
library(ggplot2)

data.frame(pasien = 0:10, prob = dbinom(x = 0:10, size = 20, prob = 0.2)) %>%
  mutate(Pasien = ifelse(pasien == 4, "4", "other")) %>%
  ggplot(aes(x = factor(pasien), y = prob, fill = Pasien)) +
  geom_col() +
  geom_text(
    aes(label = round(prob,3), y = prob + 0.01),
    position = position_dodge(0.9),
    size = 3,
    vjust = 0
  ) +
  labs(title = " Peluang terdapat 4 pasien yang sembuh.",
       subtitle = "b(10, .3)",
       x = "Sembuh (x)",
       y = "peluang") 
#2c
##mean
### exact
n * p

### simulation
mean(rbinom(10000,size = 20,p))

##Variance
###exact
n * p * q

### simulation
var(rbinom(10000, size = 20,p))