# Task 1
library(ggplot2)
#Ketik function ggplot() di bawah ini untuk membuat canvas grafik
ggplot()


# Task 2
ibrary(ggplot2)

#Penambahan judul dengan menggunakan fungsi labs
ggplot() + labs(title="Luas Wilayah vs Kepadatan Penduduk DKI Jakarta - Periode 2013")


# Task 3
# membuat plot dan menyimpan ke dalam variabel plot.jakarta
library(ggplot2)
plot.jakarta <- ggplot()
plot.jakarta <- plot.jakarta + labs(title="Luas Wilayah vs Kepadatan Penduduk DKI Jakarta - Periode 2013")
plot.jakarta

# Task 4
library(ggplot2)
plot.jakarta <- ggplot()
plot.jakarta <- plot.jakarta + labs(title="Luas Wilayah vs Kepadatan Penduduk DKI Jakarta - Periode 2013", subtitle="Tahun 2013")
plot.jakarta <- plot.jakarta + labs(x="Luas Wilayah (km2)", y="Kepadatan Jiwa per km2")
plot.jakarta