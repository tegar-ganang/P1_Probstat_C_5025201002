# 
P1_Probstat_C_5025201002
## Soal 1
 1.  Seorang  penyurvei  secara  acak  memilih  orang-orang  di  jalan  sampai  dia  bertemu  dengan
 seseorang yang menghadiri acara vaksinasi sebelumnya.
 a.  Berapa  peluang  penyurvei  bertemu  x  =  3  orang  yang  tidak  menghadiri  acara  vaksinasi
 sebelum  keberhasilan  pertama  ketika  p  =  0,20  dari  populasi  menghadiri  acara  vaksinasi  ?
 (distribusi Geometrik)
 b.  mean  Distribusi  Geometrik  dengan  10000  data  random  ,  prob  =  0,20  dimana  distribusi
 geometrik acak tersebut X = 3 ( distribusi geometrik acak () == 3 )
 c.  Bandingkan Hasil poin a dan b , apa kesimpulan yang bisa didapatkan?
 d.  Histogram Distribusi Geometrik , Peluang X = 3 gagal Sebelum Sukses Pertama
 e.  Nilai Rataan (μ) dan Varian (σ²) dari Distribusi Geometrik. 
 
Jawaban

Berikut merupakan kode dari nomor 1
```
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
```
Berikut merupakan hasil run code nomor 1

![image](https://user-images.githubusercontent.com/85062827/162606776-b3ee6352-89f0-4fc4-87f8-ffa86bdb05fe.png)

untuk no 1a kita gunakan fungsi `dgeom(x, p)` untuk mencari peluang  penyurvei  bertemu x  =  3 orang yang  tidak  menghadiri  acara  vaksinasi sebelum  keberhasilan  pertama  ketika  p  =  0,20  dari  populasi  menghadiri  acara  vaksinasi
hasilnya yaitu `[1] 0.1024`

no 1b kita gunakan fungsi `mean` dan `rgeom`. `rgeom` digunakan untuk mencari peluang dari data random
`mean(rgeom(10000, p)== 3)`
hasilnya pada saat proses run yaitu `[1] 0.1074`
perlu diingat karena ini merupakan data random maka hasil bisa berubah ubah 

no 1c kita diminta untuk melihat kesimpulan dari 1a dan 1b
`summary(dgeom(x, p))
summary(mean(rgeom(10000, p) == 3))`
hasil summarynya yaitu
> summary(dgeom(x, p))
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
 0.1024  0.1024  0.1024  0.1024  0.1024  0.1024 
> summary(mean(rgeom(10000, p) == 3))
   Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
 0.1074  0.1074  0.1074  0.1074  0.1074  0.1074 
hasilnya tidak begitu jauh walaupun untuk 10000 data random

no 1d kita diminta untuk membuat histogram
hasilnya yaitu

![image](https://user-images.githubusercontent.com/85062827/162607713-69960486-0610-484c-a694-d32c43ed6d05.png)

no 1e kita diminta untuk mencari mean dan variannya 
untuk mean data eksak didapatkan hasil yaitu 5 dengan rumus `1/p`
sedangkan untuk 10000 data random didapatkan hasil 4.9486 dengan rumus `mean(rgeom(10000,p))+1`

untuk varian eksak didapatkan hasil yaitu 20 dengan rumus `(1 - p) / p ** 2` sedangkan untuk 10000 data random didapatkan hasil 20.06526 dengan rumus `var(rgeom(10000, p))`

## Soal 2
 2.  Terdapat 20 pasien menderita Covid19 dengan peluang sembuh sebesar 0.2. Tentukan :
 a.  Peluang terdapat 4 pasien yang sembuh.
 b.  Gambarkan grafik histogram berdasarkan kasus tersebut.
 c.  Nilai Rataan (μ) dan Varian (σ²) dari Distribusi  Binomial. 

Jawaban

Berikut merupakan kode dari nomor 2

```
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
```
Berikut merupakan hasil run code nomor 2

![image](https://user-images.githubusercontent.com/85062827/162608484-6523285a-823e-4ed8-b393-2b9a75a998a9.png)

Untuk no 2a kita menggunakan rumus `dbinom(x,size = n,p)` untuk mencari Peluang terdapat 4 pasien yang sembuh menggunakan distribusi binomial
hasilnya yaitu `[1] 0.2181994`

Untuk no 2b kita diminta untuk membuat histogram
berikut merupakan hasil histogram distribusi binomial

![image](https://user-images.githubusercontent.com/85062827/162608532-ebd357e2-ab31-4376-b275-2181c49d6493.png)

untuk 2c kita diminta untuk mencari mean dan varian dari kasus tersebut.
mean eksak menggunakan rumus `n*p` hasilnya yaitu `4`. sedangkan mean dengan 10000 data random didapatkan dengan rumus `mean(rbinom(10000,size = 20,p))` dan hasilnya yaitu `4.0161`.

varian eksak menggunakan rumus `n*p*q` hasilmnya yaitu `3.2`. sedangkan varian dengan 10000 data random didapatkan dengan rumus `var(rbinom(10000, size = 20,p))` dan hasilnya yaitu `3.239224`.


