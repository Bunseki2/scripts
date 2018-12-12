
setwd("~/Synergestic")
library("ggplot2", lib.loc="~/R/R-3.4.1/library")

######
#ggplot Box All
#data<-read.table("AllposAllneg.score_swap.seg.txt.gz")
load("AllposAllneg.score_swap.seg.txt.gz.RData")
names(data)<-c("Label","scoreName","scoreValue")
no_minus_ten<-data[data$scoreValue!=-10,]
no_minus_ten$scoreName <- factor(no_minus_ten$scoreName,levels = c('Sd',
                                                                   'Se',
                                                                   'Seg',
                                                                   'Str',
                                                                   'Strg',
                                                                   'Sta',
                                                                   'Stag',
                                                                   'Sta_up',
                                                                   'Sta_dn',
                                                                   'Sup_up',
                                                                   'Sdn_up',
                                                                   'Sdn_dn',
                                                                   'Sup_dn',
                                                                   'Sta_tfuk_dn',
                                                                   'Sta_tfuk_up',
                                                                   'Sta_tfrep_dn',
                                                                   'Sta_tfrep_up',
                                                                   'Sta_tfact_dn',
                                                                   'Sta_tfact_up',
                                                                   'Sup_tfuk_dn',
                                                                   'Sdn_tfuk_dn',
                                                                   'Sup_tfuk_up',
                                                                   'Sdn_tfuk_up',
                                                                   'Sup_tfrep_dn',
                                                                   'Sdn_tfrep_dn',
                                                                   'Sup_tfrep_up',
                                                                   'Sdn_tfrep_up',
                                                                   'Sup_tfact_dn',
                                                                   'Sdn_tfact_dn',
                                                                   'Sup_tfact_up',
                                                                   'Sdn_tfact_up'),ordered = TRUE)
g<-ggplot(data = no_minus_ten, aes(x=scoreName, y=scoreValue)) + geom_boxplot(aes(fill=Label))
g+theme(axis.text=element_text(size=14),legend.text=element_text(size=14),axis.title=element_text(size=16,face="bold"))
g + theme(axis.text.x = element_text(angle = 90, hjust = 1))
png(file="box_scoreName.All.png", width = 10, height = 7, units = 'in',res=600)
g<-ggplot(data = no_minus_ten, aes(x=scoreName, y=scoreValue)) + geom_boxplot(aes(fill=Label))
g+theme(axis.text=element_text(size=14),legend.text=element_text(size=14),axis.title=element_text(size=16,face="bold"))
g + theme(axis.text.x = element_text(angle = 90, hjust = 1))
dev.off()

#DDI,non-DDI correct 
no_minus_ten$Label<- factor(no_minus_ten$Label,levels = c('DDI','non-DDI'),ordered = TRUE)
tiff(file="box_DDInonDDI.ALL.tif", width = 6.5, height = 5, units = 'in',res=600)
g2<-ggplot(data = no_minus_ten, aes(x=Label, y=scoreValue)) + geom_boxplot(aes(fill=Label))
g2+theme(axis.text=element_text(size=14),legend.text=element_text(size=14),axis.title=element_text(size=16,face="bold"))
dev.off()

##scores

Sd_DDI<-no_minus_ten[(no_minus_ten$Label=="DDI" & no_minus_ten$scoreName=="Sd"),3]
Se_DDI<-no_minus_ten[(no_minus_ten$Label=="DDI" & no_minus_ten$scoreName=="Se"),3]
Seg_DDI<-no_minus_ten[(no_minus_ten$Label=="DDI" & no_minus_ten$scoreName=="Seg"),3]
Str_DDI<-no_minus_ten[(no_minus_ten$Label=="DDI" & no_minus_ten$scoreName=="Str"),3]
Strg_DDI<-no_minus_ten[(no_minus_ten$Label=="DDI" & no_minus_ten$scoreName=="Strg"),3]
Sta_DDI<-no_minus_ten[(no_minus_ten$Label=="DDI" & no_minus_ten$scoreName=="Sta"),3]
Stag_DDI<-no_minus_ten[(no_minus_ten$Label=="DDI" & no_minus_ten$scoreName=="Stag"),3]

Sd_non_DDI<-no_minus_ten[(no_minus_ten$Label=="non-DDI" & no_minus_ten$scoreName=="Sd"),3]
Se_non_DDI<-no_minus_ten[(no_minus_ten$Label=="non-DDI" & no_minus_ten$scoreName=="Se"),3]
Seg_non_DDI<-no_minus_ten[(no_minus_ten$Label=="non-DDI" & no_minus_ten$scoreName=="Seg"),3]
Str_non_DDI<-no_minus_ten[(no_minus_ten$Label=="non-DDI" & no_minus_ten$scoreName=="Str"),3]
Strg_non_DDI<-no_minus_ten[(no_minus_ten$Label=="non-DDI" & no_minus_ten$scoreName=="Strg"),3]
Sta_non_DDI<-no_minus_ten[(no_minus_ten$Label=="non-DDI" & no_minus_ten$scoreName=="Sta"),3]
Stag_non_DDI<-no_minus_ten[(no_minus_ten$Label=="non-DDI" & no_minus_ten$scoreName=="Stag"),3]

qqnorm(Sd_DDI);qqline(Sd_DDI, col = 2)
qqnorm(Se_DDI);qqline(Se_DDI, col = 2)
qqnorm(Seg_DDI);qqline(Seg_DDI, col = 2)
qqnorm(Str_DDI);qqline(Str_DDI, col = 2)
qqnorm(Sta_DDI);qqline(Sta_DDI, col = 2)

qqnorm(Sd_non_DDI);qqline(Sd_non_DDI, col = 2)
qqnorm(Se_non_DDI);qqline(Se_non_DDI, col = 2)
qqnorm(Seg_non_DDI);qqline(Seg_non_DDI, col = 2)
qqnorm(Str_non_DDI);qqline(Str_non_DDI, col = 2)
qqnorm(Sta_non_DDI);qqline(Sta_non_DDI, col = 2)
## mean, sd

Sd_DDI_mean<-mean(no_minus_ten[(no_minus_ten$Label=="DDI" & no_minus_ten$scoreName=="Sd"),3])
Se_DDI_mean<-mean(no_minus_ten[(no_minus_ten$Label=="DDI" & no_minus_ten$scoreName=="Se"),3])
Seg_DDI_mean<-mean(no_minus_ten[(no_minus_ten$Label=="DDI" & no_minus_ten$scoreName=="Seg"),3])
Str_DDI_mean<-mean(no_minus_ten[(no_minus_ten$Label=="DDI" & no_minus_ten$scoreName=="Str"),3])
Strg_DDI_mean<-mean(no_minus_ten[(no_minus_ten$Label=="DDI" & no_minus_ten$scoreName=="Strg"),3])
Sta_DDI_mean<-mean(no_minus_ten[(no_minus_ten$Label=="DDI" & no_minus_ten$scoreName=="Sta"),3])
Stag_DDI_mean<-mean(no_minus_ten[(no_minus_ten$Label=="DDI" & no_minus_ten$scoreName=="Stag"),3])

Sd_DDI_sd<-sd(no_minus_ten[(no_minus_ten$Label=="DDI" & no_minus_ten$scoreName=="Sd"),3])
Se_DDI_sd<-sd(no_minus_ten[(no_minus_ten$Label=="DDI" & no_minus_ten$scoreName=="Se"),3])
Seg_DDI_sd<-sd(no_minus_ten[(no_minus_ten$Label=="DDI" & no_minus_ten$scoreName=="Seg"),3])
Str_DDI_sd<-sd(no_minus_ten[(no_minus_ten$Label=="DDI" & no_minus_ten$scoreName=="Str"),3])
Strg_DDI_sd<-sd(no_minus_ten[(no_minus_ten$Label=="DDI" & no_minus_ten$scoreName=="Strg"),3])
Sta_DDI_sd<-sd(no_minus_ten[(no_minus_ten$Label=="DDI" & no_minus_ten$scoreName=="Sta"),3])
Stag_DDI_sd<-sd(no_minus_ten[(no_minus_ten$Label=="DDI" & no_minus_ten$scoreName=="Stag"),3])


Sd_non_DDI_mean<-mean(no_minus_ten[(no_minus_ten$Label=="non-DDI" & no_minus_ten$scoreName=="Sd"),3])
Se_non_DDI_mean<-mean(no_minus_ten[(no_minus_ten$Label=="non-DDI" & no_minus_ten$scoreName=="Se"),3])
Seg_non_DDI_mean<-mean(no_minus_ten[(no_minus_ten$Label=="non-DDI" & no_minus_ten$scoreName=="Seg"),3])
Str_non_DDI_mean<-mean(no_minus_ten[(no_minus_ten$Label=="non-DDI" & no_minus_ten$scoreName=="Str"),3])
Strg_non_DDI_mean<-mean(no_minus_ten[(no_minus_ten$Label=="non-DDI" & no_minus_ten$scoreName=="Strg"),3])
Sta_non_DDI_mean<-mean(no_minus_ten[(no_minus_ten$Label=="non-DDI" & no_minus_ten$scoreName=="Sta"),3])
Stag_non_DDI_mean<-mean(no_minus_ten[(no_minus_ten$Label=="non-DDI" & no_minus_ten$scoreName=="Stag"),3])

Sd_non_DDI_sd<-sd(no_minus_ten[(no_minus_ten$Label=="non-DDI" & no_minus_ten$scoreName=="Sd"),3])
Se_non_DDI_sd<-sd(no_minus_ten[(no_minus_ten$Label=="non-DDI" & no_minus_ten$scoreName=="Se"),3])
Seg_non_DDI_sd<-sd(no_minus_ten[(no_minus_ten$Label=="non-DDI" & no_minus_ten$scoreName=="Seg"),3])
Str_non_DDI_sd<-sd(no_minus_ten[(no_minus_ten$Label=="non-DDI" & no_minus_ten$scoreName=="Str"),3])
Strg_non_DDI_sd<-sd(no_minus_ten[(no_minus_ten$Label=="non-DDI" & no_minus_ten$scoreName=="Strg"),3])
Sta_non_DDI_sd<-sd(no_minus_ten[(no_minus_ten$Label=="non-DDI" & no_minus_ten$scoreName=="Sta"),3])
Stag_non_DDI_sd<-sd(no_minus_ten[(no_minus_ten$Label=="non-DDI" & no_minus_ten$scoreName=="Stag"),3])

DDI_mean<-c(Sd_DDI_mean,Se_DDI_mean,Seg_DDI_mean,Str_DDI_mean,Strg_DDI_mean,Sta_DDI_mean,Stag_DDI_mean)
DDI_sd<-c(Sd_DDI_sd,Se_DDI_sd,Seg_DDI_sd,Str_DDI_sd,Strg_DDI_sd,Sta_DDI_sd,Stag_DDI_sd)

non_DDI_mean<-c(Sd_non_DDI_mean,Se_non_DDI_mean,Seg_non_DDI_mean,Str_non_DDI_mean,Strg_non_DDI_mean,Sta_non_DDI_mean,Stag_non_DDI_mean)
non_DDI_sd<-c(Sd_non_DDI_sd,Se_non_DDI_sd,Seg_non_DDI_sd,Str_non_DDI_sd,Strg_non_DDI_sd,Sta_non_DDI_sd,Stag_non_DDI_sd)

DDI_mean_sd<-cbind(DDI_mean,DDI_sd)
non_DDI_mean_sd<-cbind(non_DDI_mean,non_DDI_sd)

DDI_mean_sd
non_DDI_mean_sd

#### fort.test


Sd_DDI<-no_minus_ten[(no_minus_ten$Label=="DDI" & no_minus_ten$scoreName=="Sd"),3]
Se_DDI<-no_minus_ten[(no_minus_ten$Label=="DDI" & no_minus_ten$scoreName=="Se"),3]
Seg_DDI<-no_minus_ten[(no_minus_ten$Label=="DDI" & no_minus_ten$scoreName=="Seg"),3]
Str_DDI<-no_minus_ten[(no_minus_ten$Label=="DDI" & no_minus_ten$scoreName=="Str"),3]
Strg_DDI<-no_minus_ten[(no_minus_ten$Label=="DDI" & no_minus_ten$scoreName=="Strg"),3]
Sta_DDI<-no_minus_ten[(no_minus_ten$Label=="DDI" & no_minus_ten$scoreName=="Sta"),3]
Stag_DDI<-no_minus_ten[(no_minus_ten$Label=="DDI" & no_minus_ten$scoreName=="Stag"),3]


Sd_non_DDI<-no_minus_ten[(no_minus_ten$Label=="non-DDI" & no_minus_ten$scoreName=="Sd"),3]
Se_non_DDI<-no_minus_ten[(no_minus_ten$Label=="non-DDI" & no_minus_ten$scoreName=="Se"),3]
Seg_non_DDI<-no_minus_ten[(no_minus_ten$Label=="non-DDI" & no_minus_ten$scoreName=="Seg"),3]
Str_non_DDI<-no_minus_ten[(no_minus_ten$Label=="non-DDI" & no_minus_ten$scoreName=="Str"),3]
Strg_non_DDI<-no_minus_ten[(no_minus_ten$Label=="non-DDI" & no_minus_ten$scoreName=="Strg"),3]
Sta_non_DDI<-no_minus_ten[(no_minus_ten$Label=="non-DDI" & no_minus_ten$scoreName=="Sta"),3]
Stag_non_DDI<-no_minus_ten[(no_minus_ten$Label=="non-DDI" & no_minus_ten$scoreName=="Stag"),3]

#ks<-ks.test(Sd_DDI,Sd_non_DDI,alternative="g")
var.test(Sd_DDI,Sd_non_DDI)
t.test(Sd_DDI,Sd_non_DDI,alternative="g")
wilcox.test(Sd_DDI,Sd_non_DDI,alternative="g")

var.test(Se_DDI,Se_non_DDI)
t.test(Se_DDI,Se_non_DDI,alternative="g")
var.test(Seg_DDI,Seg_non_DDI)
t.test(Seg_DDI,Seg_non_DDI,alternative="g")
var.test(Str_DDI,Str_non_DDI)
t.test(Str_DDI,Str_non_DDI,alternative="g")
var.test(Strg_DDI,Strg_non_DDI)
t.test(Strg_DDI,Strg_non_DDI,alternative="g")

var.test(Sta_DDI,Sta_non_DDI)
t.test(Sta_DDI,Sta_non_DDI,alternative="g")

var.test(Stag_DDI,Stag_non_DDI)
t.test(Stag_DDI,Stag_non_DDI,alternative="g")

hist(Sd_DDI)

#### MAX ggplot box

data<-read.table("Max.all.ForBoxPlot.txt")
names(data)<-c("Label","Drug1","Drug2", "scoreValue")

tiff(file="box_Maxscore.ALL.tif", width = 6.5, height = 5, units = 'in',res=600)
g<-ggplot(data, aes(x=Label,y=scoreValue)) + geom_boxplot(aes(fill=Label))
g+theme(axis.text=element_text(size=14),legend.text=element_text(size=14),axis.title=element_text(size=16,face="bold"))
dev.off()

DDI<-data[data$Label=="DDI",4]
non_DDI<-data[data$Label=="non-DDI",4]
ks.test(DDI,non_DDI,alternative="g")
var.test(DDI,non_DDI)
t.test(DDI,non_DDI,alternative="g")
wilcox.test(DDI,non_DDI,alternative="g")

## correlation 
library("ggplot2", lib.loc="~/R/R-3.1.0/library")
library(reshape2)
data<-read.table("final_scores_nonZero_InclG_dti_3_2_modified.3.1.AllpositiveandAllnegative.txt")

#S4 S3 swap to see correlation with genetic information
ddi<-cbind(data[data$V17==1, 3:4], data[data$V17==1,6],data[data$V17==1,5],data[data$V17==1, 7],data[data$V17==1, 8:9])
names(ddi)<-c("Sd","Se","Seg","Str","Strg","Sta","Stag")
d_cor <- as.matrix(cor(ddi))
d_cor
melted_dcor <- melt(d_cor)
head(melted_dcor)
tiff(file="correlationDDI.AllposAllneg.tif", width = 6.5, height = 5, units = 'in',res=600)
g<-ggplot(data = melted_dcor, aes(x=Var1, y=Var2, fill=value)) + geom_tile()
g2<-g+theme(axis.text=element_text(size=14),legend.text=element_text(size=16),axis.title.x=element_blank(),axis.title.y=element_blank())
g2+scale_fill_gradient2(limits=c(0, 1), breaks=seq(0,1,by=0.25),low="darkred", high="darkblue", guide="colorbar")
dev.off()

#noddi<-data[data$V17==0, 3:9]
noddi<-cbind(data[data$V17==0, 3:4], data[data$V17==0,6],data[data$V17==0,5],data[data$V17==0, 7],data[data$V17==0, 8:9])
names(noddi)<-c("Sd","Se","Seg","Str","Strg","Sta","Stag")
d_cor_no <- as.matrix(cor(noddi))
d_cor_no
melted_dcor_no <- melt(d_cor_no)
head(melted_dcor_no)
tiff(file="correlationNonDDI.AllposAllneg.tif", width = 6.5, height = 5, units = 'in',res=600)
g<-ggplot(data = melted_dcor_no, aes(x=Var1, y=Var2, fill=value)) + 
  geom_tile()
g2<-g+theme(axis.text=element_text(size=14),legend.text=element_text(size=16),axis.title.x=element_blank(),axis.title.y=element_blank())

g2+scale_fill_gradient2(limits=c(0, 1), breaks=seq(0,1,by=0.25),low="darkred", high="darkblue", guide="colorbar")
dev.off()

####NOT USE!!!
# heatmap
tiff(file="corHeatmapDDI.AllposAllneg.tif", width = 6.5, height = 5, units = 'in',res=600)
heatmap.2(d_cor, col=redgreen(75),
density.info="none", trace="none", dendrogram=c("row"),
symm=F,symkey=T,symbreaks=T, scale="none", Colv=F)
dev.off()

tiff(file="corHeatmapNonDDI.AllposAllneg.tif", width = 6.5, height = 5, units = 'in',res=600)
heatmap.2(d_cor_no, col=redgreen(75),
density.info="none", trace="none", dendrogram=c("row"),
symm=F,symkey=T,symbreaks=T, scale="none", Colv=F)
dev.off()


tiff(file="corHeatmapNonDDI.AllposAllneg.tif", width = 6.5, height = 5, units = 'in',res=600)
heatmap.2(d_cor_no, col=redgreen(75),
          density.info="none", trace="none", dendrogram=c("row"),reorderfun=function(d, w) reorder(d, c(24,7,6,5,4,2,1)),
          symm=F,symkey=T,symbreaks=T, scale="none", Colv=F)
dev.off()

tiff(file="corHeatmapDDI.AllposAllneg.tif", width = 6.5, height = 5, units = 'in',res=600)
heatmap.2(d_cor, col=redgreen(75),
          density.info="none", trace="none", dendrogram=c("row"),reorderfun=function(d, w) reorder(d, c(24,7,6,5,4,2,1)),
          symm=F,symkey=T,symbreaks=T, scale="none", Colv=F)
dev.off()

hclustfunc <- hclust
distfunc <- dist
heatmap.2(d_cor_no, col=redgreen(75),
          density.info="none", trace="none", dendrogram=c("row"),   
          symm=F,symkey=T,symbreaks=T, scale="none",  revC = identical("Colv", "Rowv"))


heatmap.2(d_cor_no, col=redgreen(75),
          density.info="none", trace="none", dendrogram=c("row"),   
          symm=F,symkey=T,symbreaks=T, scale="none", Colv=c(3,7,6,5,4,2,1), Rowv=c(1,2,4,5,6,7,3))

heatmap.2(d_cor_no, col=redgreen(75),dendrogram=c("row"),dd= as.dendrogram(hc),
          dd.reorder = reorder(dd,c(3,7,6,5,4,2,1) ),
          density.info="none", trace="none",   
          symm=F,symkey=T,symbreaks=T, scale="none", Rowv=c(1,2,4,5,6,7,3))
revC = identical(Colv, "Rowv"),


