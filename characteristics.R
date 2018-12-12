###how many, what kind of genes are up/dn regulated for drug with syn-ddi

cat( "up reg")
for (i in 1: nrow(comb2_inL1000_dbid)){
  pairs<-comb2_inL1000_dbid[i,]  
  up_genes1<-up_gene[up_gene$V2 %in% as.character(pairs[,1]), 2]
  up_genes2<-up_gene[up_gene$V2 %in% as.character(pairs[,2]), 2]
  overlap_up_genes<-up_genes1[up_genes1 %in% up_genes2 ]
  cat(as.character(pairs[,1]), as.character(pairs[,2]),overlap_up_genes, "\n")
}

cat( "down reg")
for (i in 1: nrow(comb2_inL1000_dbid)){
  pairs<-comb2_inL1000_dbid[i,]  
  dn_genes1<-dn_gene[dn_gene$V2 %in% as.character(pairs[,1]), 2]
  dn_genes2<-dn_gene[dn_gene$V2 %in% as.character(pairs[,2]), 2]
  overlap_dn_genes<-dn_genes1[dn_genes1 %in% dn_genes2 ]
  cat(as.character(pairs[,1]), as.character(pairs[,2]),overlap_dn_genes, "\n")
}


cat("non-syn")


load("up_dbid_gene.RData")
load("dn_dbid_gene.RData")
load("comb2_inL1000_dbid.RData")
load("dbid_L1000.RData")

Up_comb2_gene<-read.table("overlap_Up_genes_comb2_inL1000.num.txt")
Dn_comb2_gene<-read.table("overlap_Dn_genes_comb2_inL1000.num.txt")
hist(Up_comb2_gene$V1,breaks=16)
hist(Dn_comb2_gene$V1,breaks=16)
boxplot(Up_comb2_gene$V1, Dn_comb2_gene$V1)

Up_non_syn_gene<-read.table("no_syn.up.num.txt")
Dn_non_syn_gene<-read.table("no_syn.dn.num.txt")
hist(Up_non_syn_gene$V1,breaks=16)
hist(Dn_non_syn_gene$V1,breaks=16)
boxplot(Up_non_syn_gene$V1, Dn_non_syn_gene$V1)


boxplot(Up_non_syn_gene$V1,Up_comb2_gene$V1)
boxplot(Dn_non_syn_gene$V1,Dn_comb2_gene$V1)

boxplot(Dn_non_syn_gene$V1,Dn_comb2_gene$V1, notch=T, ylim=c(0,15))
boxplot(Up_non_syn_gene$V1,Up_comb2_gene$V1, notch=T, ylim=c(0,15))
library(vioplot)

vioplot(Up_non_syn_gene$V1,Up_comb2_gene$V1)
vioplot(Dn_non_syn_gene$V1,Dn_comb2_gene$V1)


all_data<-read.table("final2_all.txt")
#boxplot(all_data[all_data$V21==1, 8],all_data[all_data$V21==0, 8] )
library(vioplot)
no_minus_ten_10_one<-all_data[(all_data$V21 == 1 & all_data$V10 != -10),10]
no_minus_ten_10_zero<-all_data[(all_data$V21 == 0 & all_data$V10 != -10),10]
boxplot(no_minus_ten_10_one,no_minus_ten_10_zero )
boxplot(no_minus_ten_10_one,no_minus_ten_10_zero,notch=T )
no_minus_ten_11_one<-all_data[(all_data$V21 == 1 & all_data$V11 != -10),11]
no_minus_ten_11_zero<-all_data[(all_data$V21 == 0 & all_data$V11 != -10),11]
boxplot(no_minus_ten_11_one,no_minus_ten_11_zero )
boxplot(no_minus_ten_11_one,no_minus_ten_11_zero ,notch=T)
vioplot(no_minus_ten_10_one,no_minus_ten_10_zero )
vioplot(no_minus_ten_11_one,no_minus_ten_11_zero )
t.test(no_minus_ten_10_one,no_minus_ten_10_zero )
t.test(no_minus_ten_11_one,no_minus_ten_11_zero )
