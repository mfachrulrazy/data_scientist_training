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

# Task 3
# Menemukan data Bottom 10
library(arules)
transaksi_tabular <- read.transactions(file="transaksi_dqlab_retail.tsv", format="single", sep="\t", cols=c(1,2), skip=1)
bottom_ten <- itemFrequency(transaksi_tabular, type="absolute")
bottom_ten <- sort(bottom_ten)
bottom_ten <- bottom_ten[1:10]
bottom_ten <- data.frame("Nama.Produk"=names(bottom_ten),"Jumlah"=bottom_ten, row.names=NULL)
write.csv(bottom_ten, file="bottom10_item_retail.txt", sep=",")

# Task 4
library(arules)
transaksi_tabular <- read.transactions(file="transaksi_dqlab_retail.tsv", format="single", sep="\t", cols=c(1,2), skip=1)
apriori_rules <- apriori(transaksi_tabular, parameter=list(supp=10/length(transaksi_tabular), conf=0.5, minlen=2, maxlen=3))
apriori_rules <- head(sort(apriori_rules, decreasing=T, by="lift"), n=10)
write(apriori_rules, file="kombinasi_retail.txt")

# Task 5
library(arules)
transaksi_tab <- read.transactions(file="transaksi_dqlab_retail.tsv", format="single", sep="\t", cols=c(1,2), skip=1)
kombinasi <- apriori(transaksi_tab, parameter=list(sup=10/length(transaksi_tab), conf=0.1, target="rules", minlen=2, maxlen=3))
rule_1 <- subset(kombinasi, rhs %in% "Tas Makeup")
rule_2 <- subset(kombinasi, rhs %in% "Baju Renang Pria Anak-anak")
rule_1 <- sort(rule_1, by="lift", decreasing=T)[1:3]
rule_2 <- sort(rule_2, by="lift", decreasing=T)[1:3]
rules <- c(rule_1, rule_2)
write(rules, file="kombinasi_retail_slow_moving.txt")