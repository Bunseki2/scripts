library("caret", lib.loc="~/R/R-3.1.0/library")
library("ROCR", lib.loc="~/R/R-3.1.0/library")

library("pca3d", lib.loc="~/R/R-3.1.0/library")
data<-read.table("file:///C:/Users/takedatn/Documents/DDI/final_scores_For_train_picked_ddi_nonZero_InclG_dti_3_2_modified.3.1.internal.txt")
pca <- prcomp(data[,3:9], center = TRUE, scale. =TRUE)
pca3d(pca, components = c(1,2,4), col = data[,17]+1, radius=0.3)
pca2d(pca, components = c(1,3), col = data[,17]+1, radius=0.3)
str(pca)
pca$x[1:3,]
test<-read.table("file:///C:/Users/takedatn/Documents/DDI/final_scores_For_test_picked_ddi_nonZero_InclG_dti_3_2_modified.3.1.external.txt")
pca_test<-scale(test[,3:9], pca$center, pca$scale) %*% pca$rotation 
A2<-pca$x
B1<-data[,17]
mod<-train(A2,B1,method="glm",trControl=trainControl(method="repeatedcv",number=4,repeats=5,returnResamp="none",verboseIter=TRUE,classProbs=TRUE,savePredictions=TRUE),preProcess=c("center","scale"),tuneLength = 20)
head(A2,3)
head(pca,3)
coef(mod$finalModel)
pred<-predict(mod$finalModel, type="response")
pred1 <- prediction( as.numeric(pred), as.numeric(B1))
perf <- performance(pred1,"tpr","fpr")
auc<-performance(pred1, "auc")@y.values[[1]]
auc
T2<-pca_test
T1<-test[,17]
preProcValues <- preProcess(T2, method = c("center", "scale"))
newdata<- predict(preProcValues, T2)
newdata<-as.data.frame(newdata)
pred<-predict(mod$finalModel, newdata=newdata,type="response")
pred1 <- prediction( as.numeric(pred), as.numeric(T1))
perf <- performance(pred1,"tpr","fpr")
auc<-performance(pred1, "auc")@y.values[[1]]
auc

x<-pred
C<-{}
for(i in 1:length(x)){
  if( x[i]>.5 ) {
    C[i] <- 1;
  }else{
    C[i] <- 0;
  }
}
confusionMatrix(factor(C), factor(T1))

A2<-pca$x[,1:4]
B1<-data[,17]
mod<-train(A2,B1,method="glm",trControl=trainControl(method="repeatedcv",number=4,repeats=5,returnResamp="none",verboseIter=TRUE,classProbs=TRUE,savePredictions=TRUE),tuneLength = 20)


simva<-read.table("file:///C:/Users/takedatn/Documents/DDI/final_scores_For_all.DB00641.ddi.nonZero.incluGenetic_dti_modified.txt")
pca_simva <- prcomp(simva[,3:9], center = TRUE, scale. =TRUE)
pca2d(pca_simva, components = c(1,2), col = simva[,17]+1, radius=0.3)
pca2d(pca_simva, components = c(1,2), col = simva[,17]+1, radius=0.5)
pca3d(pca_simva, components = c(1,2,3), col = simva[,17]+1, radius=0.5)

warf<-read.table("file:///C:/Users/takedatn/Documents/DDI/final_scores_For_all.DB00682.ddi.nonZero.incluGenetic_dti_modified.txt")
pca_warf <- prcomp(warf[,3:9], center = TRUE, scale. =TRUE)
pca2d(pca_warf, components = c(1,2), col = warf[,17]+1, radius=0.3)
pca2d(pca_warf, components = c(1,2), col = warf[,17]+1, radius=0.5)
pca3d(pca_warf, components = c(1,2,3), col = warf[,17]+1, radius=0.5)
