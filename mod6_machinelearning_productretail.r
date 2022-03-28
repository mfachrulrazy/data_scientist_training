# Task 1
library(arules)
transaksi_tabular <- read.transactions(file="https://storage.googleapis.com/dqlab-dataset/transaksi_dqlab_retail.tsv", format="single", sep="\t", cols=c(1,2), skip=1)
write(transaksi_tabular, file="test_project_retail_1.txt", sep=",")


# Task 2
# Menemukan data Top 10
library(arules)
transaksi_tabular <- read.transactions(file="transaksi_dqlab_retail.tsv",format="single",sep="\t", cols=c(1,2), skip=1)
top_ten <- itemFrequency(transaksi_tabular, type="absolute")
top_ten <- sort(top_ten, decreasing=TRUE)[1:10]
top_ten <- data.frame("Nama.Produk"=names(top_ten), "Jumlah"=top_ten, row.names=NULL)
write.csv(top_ten, file="top10_item_retail.txt", sep=",")