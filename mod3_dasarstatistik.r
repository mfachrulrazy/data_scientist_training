## Task 1: fungsi string(str) untuk melihat tipe data/informasi atau skema data dari dataset yang diimport
data_intro <- read.csv("https://storage.googleapis.com/dqlab-dataset/data_intro.csv",sep=";")
str(data_intro)

## Teori 2
data_intro$ID.Pelanggan <- as.character(data_intro$ID.Pelanggan)

## mengubah data menjadi karakter karena tidak dilakukan analisis statistik pada variabel ID Pelanggan dan nama
data_intro$ID.Pelanggan <- as.character(data_intro$ID.Pelanggan)
data_intro$Nama <- as.character(data_intro$Nama)
## melihat apakah sudah berhasil dalam mengubah variabel tersebut
str(data_intro$ID.Pelanggan)
str(data_intro$Nama)

## Teori 3
# Pada data_intro beberapa variabelnya bersifat kualitatif yaitu variabel jenis kelamin, produk, dan Tingkat_Kepuasan. Variabel tersebut harus di ubah jenis datanya menjadi faktor untuk mendapatkan karakteristik dari setiap pelanggan (observasi).

## Mengubah data menjadi factor untuk membedakan data kualitatif dengan menggunakan functon as.factor
data_intro$Jenis.Kelamin <- as.factor(data_intro$Jenis.Kelamin)
data_intro$Produk <- as.factor(data_intro$Produk)
data_intro$Tingkat.Kepuasan <- as.factor(data_intro$Tingkat.Kepuasan)
## Melihat apakah sudah berhasil dalam mengubah variabel tersebut dengan menggunakan function str
str(data_intro$Jenis.Kelamin)
str(data_intro$Produk)
str(data_intro$Tingkat.Kepuasan)

## Teori 4
# Skala Pengukuran Data
# Setelah data diubah jenis tipe datanya, selanjutnya adalah pemeriksaan untuk memastikan apakah tipe data setiap variabel sudah sesuai dengan skala pengukuran masing-masing.

# melihat data/ pemanggilan data
data_intro
# melihat tipe data
str(data_intro)


## Teori 5
library(pracma)
## carilah modus untuk kolom Produk pada variable data_intro
Mode(data_intro$Produk)
## carilah modus untuk kolom Tingkat.Kepuasan pada variable data_intro
Mode(data_intro$Tingkat.Kepuasan)

## Teori 6
## carilah median untuk kolom Pendapatan dari variable data_intro
median(data_intro$Pendapatan)

## carilah median untuk  kolom Harga dari variable data_intro
median(data_intro$Harga)

## carilah median untuk kolom Jumlah dari variable data_intro
median(data_intro$Jumlah)

## carilah median untuk  kolom Total dari variable data_intro
median(data_intro$Total)

## Teori 6
## carilah mean untuk kolom Pendapatan pada variable data_intro
mean(data_intro$Pendapatan)
## carilah mean untuk kolom Harga pada variable data_intro
mean(data_intro$Harga)
## carilah mean untuk kolom Jumlah pada variable data_intro
mean(data_intro$Jumlah)
## carilah mean untuk kolom Total pada variable data_intro
mean(data_intro$Total)


## Teori 7 menghitung Range
## carilah range untuk kolom Pendapatan pada variable data_intro
max(data_intro$Pendapatan)-min(data_intro$Pendapatan)

## Teori 8 var adalah function yang digunakan untuk mendapatkan nilai varians dari data.
## Carilah varians untuk kolom Pendapatan dari variable data_intro
var(data_intro$Pendapatan)

## Teori 9 sd adalah function yang digunakan untuk mendapatkan nilai simpangan baku dari data.
## Carilah simpangan baku untuk kolom Pendapatan dari variable data_intro
sd(data_intro$Pendapatan)


#################################

# Teori 1
# Function summary akan menampilkan kesimpulan pada variabel masing-masing. Untuk variabel bertipe character akan menampilkan panjang datanya. Variabel bertipe factor akan menampilkan jumlah data pada masing-masing kelas. Sedangkan untuk variabel bertipe numerik akan memunculkan nilai minimum, Q1,Q2 (median), Q3, mean, dan maximum.

## carilah summary data dari data_intro
summary(data_intro)


# Task 2
## Carilah sebaran data kolom Jenis.Kelamin dari variable data_intro
plot(data_intro$Jenis.Kelamin)

## Carilah sebaran data dari Pendapatan dari variable data_intro
hist(data_intro$Pendapatan)

## Carilah sebaran data dari Produk dari variable data_intro
plot(data_intro$Produk)

## Carilah sebaran data dari Harga dari variable data_intro
hist(data_intro$Harga)

## Carilah sebaran data dari Jumlah dari variable data_intro
hist(data_intro$Jumlah)

## Carilah sebaran data dari Total dari variable data_intro
hist(data_intro$Total)

## Carilah sebaran data dari Tingkat.Kepuasan dari variable data_intro
plot(data_intro$Tingkat.Kepuasan)

## Task 3
# membuat scatter plot untuk melihat arah dan kekuatan korelasi
plot(data_intro$Pendapatan,data_intro$Total)

## Task 4
#Gunakan cor.test untuk mencari hubungan Pendapatan dengan Total Belanja 
cor.test(data_intro$Pendapatan,data_intro$Total)

## Task 5
## carilah boxplot antara variabel jenis kelamin dengan total belanja
boxplot(Total~Jenis.Kelamin,data = data_intro)

## analisis bagaimana hubungan jenis kelamin dengan total belanja mengunakan uji statistik t-test
t.test(Total~Jenis.Kelamin,data = data_intro)