setwd("~/DDI")
load("positive_interaction.RData") ## DDI data
setwd("~/Synergestic")
load("dcdb2_components_dbid_comb2_col2_noNA_v1v2v2v1.RData")
df<-rbind(comb2_dbid_v1v2v2v1, positive_interaction)
nondup.df<- unique( df[ , 1:2 ] )
#nonbenefitial.ddi<-nondup.df[!comb2_dbid_v1v2v2v1,]
#nonbenefitial.ddi<-df[!duplicated(df,fromLast = FALSE)&!duplicated(df,fromLast = TRUE),] 



x<-comb2_dbid_v1v2v2v1
y<-positive_interaction

combined1 <-sort(union(levels(x$V1),  levels(y$V1)))
combined2 <-sort(union(levels(x$V2),  levels(y$V2)))
combined3 <-factor(sort(union(combined1,combined2)))
class(combined3)


xmu<-mutate(x, V1=factor(V1, levels=combined3),V2=factor(V2, levels=combined3))
ymu<-mutate(y, V1=factor(V1, levels=combined3), V2=factor(V2, levels=combined3))
n <- anti_join(ymu, xmu,by=c("V1", "V2") )
m <- left_join(ymu, xmu,by=c("V1", "V2") )


head(ymu)
yy<-head(ymu)
xx<-ymu[c(1,3,5),]
xxmu<-mutate(xxmu, V1=factor(V1, levels=combined3),V2=factor(V2, levels=combined3))
xxmu<-mutate(xx, V1=factor(V1, levels=combined3),V2=factor(V2, levels=combined3))
yymu<-mutate(yy, V1=factor(V1, levels=combined3),V2=factor(V2, levels=combined3))
nyy<-anti_join(yymu, xxmu,by=c("V1", "V2") )
yy
xx
nyy

##inner-join
merge(xmu, ymu, by=c("V1", "V2") )
merge(xxmu, yymu, by=c("V1", "V2"))
