###
# Make RData files
###

setwd("~/Python Scripts/data/upDnforCells")

cells=c('A375','A549','HA1E','HCC515','HEPG2','HT29','PC3','VCAP','MCF7')
UD=c('up','dn')
Duration=c('6','24')

for(i in 1:length(cells)){
  for(j in 1:length(Duration)){
  
      #data <- read.table("CELL_10_TIME_UD_name_cid_brd_dbid_gene.txt", header=False, sep="\t")
      data <- read.table(paste(cells[i],"_10_",Duration[k],"H_dn_name_cid_brd_dbid_gene.txt", sep=""), header=F, sep="\t")
      dn_gene<-na.omit(data[,4:5])
      #head(data_noNA)
      save(dn_gene, file=paste0(cells[i],"_10_",Duration[k],"H_dn.RData"))

  }
}


for(i in 1:length(cells)){
  for(j in 1:length(Duration)){
    
    #data <- read.table("CELL_10_TIME_UD_name_cid_brd_dbid_gene.txt", header=False, sep="\t")
    data <- read.table(paste(cells[i],"_10_",Duration[k],"H_up_name_cid_brd_dbid_gene.txt", sep=""), header=F, sep="\t")
    up_gene<-na.omit(data[,4:5])
    #head(data_noNA)
    save(up_gene, file=paste0(cells[i],"_10_",Duration[k],"H_up.RData"))
    
  }
}


#setwd("~/Synergestic") 
FP_all<-read.table("data_name_brd_dbid_cid.noNA.dbid.FP_space.uniq.txt", header=F, sep="")
#save(FP_all, file="data_name_brd_dbid_cid.noNA.dbid.FP_space.uniq.RData")


setwd("~/Python Scripts/data")

comb2_dbid <- read.table("dcdb2_components_dbid_comb2_col2_noNA.txt", header=F, sep="\t")
save(comb2_dbid, file="dcdb2_components_dbid_comb2_col2_noNA.RData")
temp<-cbind(comb2_dbid$V2, comb2_dbid$V1)
comb2_dbid_v1v2v2v1<-rbind(comb2_dbid, temp)
save(comb2_dbid_v1v2v2v1, file="dcdb2_components_dbid_comb2_col2_noNA_v1v2v2v1.RData")
non_effic_dbid <- read.table("data_non_efficacy_dbid.comb2.col2_noNA.txt", header=F, sep="\t")
save(non_effic_dbid, file="data_non_efficacy_dbid.comb2.col2_noNA.RData")
temp<-cbind(non_effic_dbid$V2, non_effic_dbid$V1)
non_effic_dbid_v1v2v2v1<-rbind(non_effic_dbid, temp)
save(non_effic_dbid_v1v2v2v1, file="data_non_efficacy_dbid.comb2.col2_noNA_v1v2v2v1.RData")

  
#all_dbid <- read.table("all_dcdb2_components_dbid_noNA_sorted_uniq.txt", header=F, sep="\t")
#save(all_dbid, file="all_dcdb2_components_dbid_noNA_sorted_uniq.RData")

#all_dbid <- read.table("all_bdid_withCid.txt", header=F, sep="\t")
#save(all_dbid,file="all_bdid_withCid.RData")



###06012017###
#setwd("~/Synergestic") 
##not neccessary
#load("FP_all_12_20_2016.fixed.RData")
#setwd("~/Python Scripts/data")
#brdid_cid_dbid<- read.table("../data_brdid_cid_dbid3_noNA.fromPubChemIDExchangecid_dbid.fixed.txt", sep=" ",   header=F)
#length(brdid_cid_dbid[brdid_cid_dbid$V3 %in% FP_all$V1, 3])
#no_fp_in_FP_all_12_20_2016.fixed <- brdid_cid_dbid[!(brdid_cid_dbid$V3 %in% FP_all$V1), ]
#write.table(no_fp_in_FP_all_12_20_2016.fixed, file="no_fp_in_FP_all_12_20_2016.fixed.txt", sep=" ", row.names=FALSE, col.names=FALSE, #quote=FALSE)

####06062017####
setwd("~/Synergestic") 
dti<-read.table("~/Synergestic/target_drugbank/Target_uniprot.txt", sep="\t",   header=F)
save(dti, file="~/Synergestic/target_uniprot.RData")

drug_enzyme <-read.table("~/Synergestic/enzyme_drugbank/enzyme_uniprot.txt", sep="\t",   header=F)
save(drug_enzyme, file='~/Synergestic/enzyme_uniprot.RData')

drug_transporter <-read.table("~/Synergestic/transporter_drugbank/transporter_uniprot.txt", sep="\t",   header=F)
save(drug_transporter, file="~/Synergestic/transporter_uniprot.RData")





ppi<-read.table("BIOGRID-ORGANISM-3.4.149.tab2/BIOGRID-ORGANISM-Homo-sapiens-3.4.149.tab2.AB.Physical.uniq.txt", header=F)
save(ppi, file="BIOGRID-ORGANISM-Homo-sapiens-3.4.149.tab2.AB.Physical.uniq.RData")

####06072017####
gkb_dbid_uniprotid <- read.table("~/Synergestic/relationships/gkb_dbid_uniprotid_noNA.txt", header=F)
save(gkb_dbid_uniprotid, file="gkb_dbid_uniprotid_noNA.RData")


protid_entrezid_uniq <- read.table("BIOGRID-ORGANISM-3.4.149.tab2/uniprotid_geneid_reviewed.2.1to1.all.txt",header=F)
save(protid_entrezid_uniq,file="uniprotid_geneid_reviewed.2.1to1.all.RData")

####06082017####

up_gene<-read.table("~/Python Scripts/data/upDnforPC3Need/PC3_10_6H_results_up_dbid_geneid_noNA.txt", sep=" ",   header=F)
save(up_gene,file="~/Python Scripts/data/upDnforPC3Need/PC3_10_6H_results_up_dbid_geneid.RData")

dn_gene<-read.table("~/Python Scripts/data/upDnforPC3Need/PC3_10_6H_results_dn_dbid_geneid_noNA.txt", sep=" ",   header=F)
save(dn_gene,file="~/Python Scripts/data/upDnforPC3Need/PC3_10_6H_results_dn_dbid_geneid.RData")


#FP_all_prep<- read.table("~/Synergestic/FP_all_dbid_with_cid_With_space.test2.txt",sep=" ",   header=F)
#FP_all <- FP_all_prep[,c(1,3:883)]
#save(FP_all, file="FP_all_dbid_with_cid_With_space.test2.RData")

####06122017####

all_dbid<-read.table("~/Synergestic/all_dbid_with_cidAndFp.uniq.txt",   header=F)
save(all_dbid, file="all_dbid_with_cidAndFp.uniq.RData")

####06132017####

fp_need<- read.table("~/Synergestic/FP_needed.fixed.txt",header=F)
fp_need_cid<-exam_drug[exam_drug$V3 %in% as.character(fp_need$V1),2]
write.table(fp_need_cid, file="fp_need_cid.txt",row.names=FALSE , col.names=FALSE, quote=FALSE)
fp_need_brd_cid_db<-exam_drug[exam_drug$V3 %in% as.character(fp_need$V1),]
write.table(fp_need_brd_cid_db,file="fp_need_brd_cid_db.txt",sep=" ", row.names=FALSE , col.names=FALSE, quote=FALSE)


## remove DBC-AMP
exam_drug<-read.table("data_brdid_cid_dbid3_noNA.fromPubChemIDExchangecid_dbid.fixed.txt", header=F)
exam_drug<-exam_drug[exam_drug$V3 != "DBC-AMP", ]
save(exam_drug, file="data_brdid_cid_dbid3_noNA.fromPubChemIDExchangecid_dbid.fixed.RData")


#### 06142017 ####

## add fp in the exam_drugs that were not in  FP_all_dbid_with_cid_With_space.2.txt
FP_all<- read.table("~/Synergestic/all_dbid_with_cid_results_PubChemIDExchange.fixedDoublecids.dbid.FP.space.notab.addition.txt",sep=" ", header=F)
save(FP_all, file="all_dbid_with_cid_results_PubChemIDExchange.fixedDoublecids.dbid.FP.space.notab.addition.RData")

all_dbid<-FP_all$V1
save(all_dbid, file="all_dbid_with_cidAndFp.FromFP_ALL.RData")


### 07212017 #####
tf_gene_uk <- read.table("~/Synergestic/tf_gene_trrust_geneids_noNA_int_unknown.txt", header=F)
save(tf_gene_uk, file="~/Synergestic/RData/tf_gene_uk.RData")
tf_gene_Rpr <- read.table("~/Synergestic/tf_gene_trrust_geneids_noNA_int_Repression.txt", header=F)
save(tf_gene_Rpr, file="~/Synergestic/RData/tf_gene_Rpr.RData")
tf_gene_Act <- read.table("~/Synergestic/tf_gene_trrust_geneids_noNA_int_Activation.txt", header=F)
save(tf_gene_Act, file="~/Synergestic/RData/tf_gene_Act.RData")
