# P1_Probstat_C_5025201002
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

## Soal 3
 3.  Diketahui data dari  sebuah tempat bersalin di rumah sakit tertentu menunjukkan rata-rata historis
 4,5 bayi lahir di rumah sakit ini setiap hari. (gunakan Distribusi Poisson)

Code no 3 adalah sebagai berikut

 a.  Berapa peluang bahwa 6 bayi akan lahir di rumah sakit ini besok?
 b.  simulasikan dan buatlah histogram kelahiran 6 bayi akan lahir di rumah sakit ini  selama
 setahun (n = 365)
 c.  dan bandingkan hasil poin a dan b , Apa kesimpulan yang bisa didapatkan
 d.  Nilai Rataan (μ) dan Varian (σ²) dari Distribusi  Poisson. 
 
 ## Soal 4
  4.  Diketahui nilai x = 2 dan v = 10. Tentukan:
 a.  Fungsi Probabilitas dari Distribusi Chi-Square.
 b.  Histogram dari Distribusi Chi-Square dengan 100 data random.
 c.  Nilai Rataan (μ) dan Varian (σ²) dari Distribusi  Chi-Square. 

Berikut merupakan keseluruhan kode untuk no 4

```
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
```

Berikut merupakan screenshoot untuk nomor 4

![image](https://user-images.githubusercontent.com/85062827/162620239-69e8b942-d115-4c58-9b0a-ee50c9910599.png)

 a.  Fungsi Probabilitas dari Distribusi Chi-Square.
 menggunakan dungsi `dchisq`
 
 ```
 #4a  Fungsi Probabilitas dari Distribusi Chi-Square.
dchisq(x, v)
 ```
 outputnya yaitu `[1] 0.007664155`
 
 b.  Histogram dari Distribusi Chi-Square dengan 100 data random.
 
 ```
 #4b
hsl <- rchisq(100, df = v)
hsl
hist(hsl, 
     freq = FALSE, 
     xlim = c(0,50), 
     ylim = c(0,0.2))

 ```
 hasil run kode tersebut adalah
 
 ![image](https://user-images.githubusercontent.com/85062827/162620525-86ff1e36-1d49-475b-9d58-4c5197bf40f2.png)
 
 c.  Nilai Rataan (μ) dan Varian (σ²) dari Distribusi  Chi-Square. 
```
#4c
##mean
mean <- v
mean
##variance
variance <- 2*v
variance

```
mean untuk distribusi chi-square sama dengan v atau derajat kebebasan
varian untuk distriusi chi-square sama dengan 2*v

output mean : `10`
output varian : `20`

# Soal 5
 5.  Diketahui bilangan acak  (random variable)  berdistribusi  exponential (λ = 3). Tentukan
 a.  Fungsi Probabilitas dari Distribusi Exponensial
 b.  Histogram dari Distribusi Exponensial untuk 10, 100, 1000 dan 10000 bilangan random 
 c.  Nilai Rataan (μ) dan Varian (σ²) dari Distribusi  Exponensial untuk n = 100 dan λ = 3 
  
 Petunjuk:
 ●  Gunakan set.seed(1)
 ●  Gunakan fungsi bawaan R 
 
 Berikut merupakan keseluruhan kode untuk no 5
 
 ```
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
```
 
 Berikut merupakan screenshoot untuk nomor 5
 
![image](https://user-images.githubusercontent.com/85062827/162620919-f54d8a6c-a62b-4f95-ad34-99a9915f431e.png)

a.  Fungsi Probabilitas dari Distribusi Exponensial

```
set.seed(1)
N <- 10
y_rexp <- rexp(N, lambda)
hist(y_rexp,breaks = 5, 
     main = "10 data")
```

b.  Histogram dari Distribusi Exponensial untuk 10, 100, 1000 dan 10000 bilangan random 

```
set.seed(1)
N <- 10
y_rexp <- rexp(N, lambda)
hist(y_rexp,breaks = 5, 
     main = "10 data")
```

histogram untuk n = 10

![image](https://user-images.githubusercontent.com/85062827/162621326-b041490f-d7f1-4579-b773-b780a6ee17e6.png)

```
N <- 100
y_rexp <- rexp(N, lambda)
hist(y_rexp,breaks = 50, main = "100 data")
```
histogram untuk n = 100

![image](https://user-images.githubusercontent.com/85062827/162621424-4219ab2a-4c7d-4238-a97c-f5d5a9f89b7e.png)

```
N <- 1000
y_rexp <- rexp(N, lambda)
hist(y_rexp, breaks = 500, main = "1000 data")
```

histogram untuk n = 1000

![image](https://user-images.githubusercontent.com/85062827/162621452-4d5bd6ef-322d-4a4c-8d55-fe4e4ef2fba3.png)

```
N <- 10000
y_rexp <- rexp(N, lambda)
hist(y_rexp, breaks = 5000, main = "10000 data")

```

histogram untuk n = 10000

![image](https://user-images.githubusercontent.com/85062827/162621838-0393b5d1-18cf-4c4b-8eb1-5c78565e8e4e.png)

c.  Nilai Rataan (μ) dan Varian (σ²) dari Distribusi  Exponensial untuk n = 100 dan λ = 3 

```
mean(rexp(100, lambda))

var(rexp(100, lambda))
```
Hasil rataan untuk n = 100 dan λ = 3 
`[1] 0.3675159`

Hasil variansi untuk n = 100 dan λ = 3 
`[1] 0.09725574`
 
# Soal 6
 6.  Diketahui generate random nilai sebanyak 100 data, mean = 50, sd = 8. Tentukan
 a.  Fungsi Probabilitas dari Distribusi Normal P(X1 ≤ x ≤ X2), hitung Z-Score Nya dan plot
 data generate randomnya dalam bentuk grafik. Petunjuk(gunakan fungsi plot()).
 Keterangan :
 X1 = Dibawah rata-rata
 X2 = Diatas rata-rata
 Contoh data : 
  1,2,4,2,6,3,10,11,5,3,6,8
 rata-rata = 5.083333
 X1 = 5
 X2 = 6 
 b.  Generate Histogram dari Distribusi Normal dengan breaks 50 dan format penamaan:
 NRP_Nama_Probstat_{Nama Kelas}_DNhistogram
 Contoh :
 312312312_Rola_Probstat_A_DNhistogram 
 c.  Nilai Varian (  ) dari hasil generate random nilai  Distribusi Normal. 
 σ² 
 
 Berikut merupakan keseluruhan kode untuk no 6
 
 Berikut merupakan screenshoot untuk nomor 6


