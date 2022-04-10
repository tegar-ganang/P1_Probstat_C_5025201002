# 1a
p = 0.20
x = 3
dgeom(x, p)

# 1b
mean(rgeom(10000, p)== 3)

# 1c
summary(dgeom(x, p))
summary(mean(rgeom(10000, p) == 3))

# 1d
library(dplyr)
library(ggplot2)

data.frame(x = 0:10, prob = dgeom(x = 0:10, prob = p)) %>%
  mutate(gagal = ifelse(x == 3, 3, "lainnya")) %>%
  ggplot(aes(x = factor(x), y = prob, fill = gagal)) +
  geom_col() +
  geom_text(
    aes(label = round(prob,4), y = prob + 0.01),
    position = position_dodge(0.9),
    size = 3,
    vjust = 0
  ) +
  labs(title = "Peluang X = 3 gagal Sebelum Sukses Pertama",
       subtitle = "Geometric(.2)",
       x = "gagal Sebelum Sukses Pertama (x)",
       y = "probabilitas")  

# 1e
# mean
# eksakta
1/p
# 10000 data random
mean(rgeom(10000,p))+1

#variance
#eksakta
(1 - p) / p ** 2
#10000 data random
var(rgeom(10000, p))
