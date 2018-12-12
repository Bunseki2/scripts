########################################################################
# y <- as.factor(sample(c("N", "P"), 50, replace = TRUE))
# y <- sample(c(0, 1), 50, replace = TRUE)
# x <- matrix(runif(50 * 2), 50, 2)


## for cross-validation
cvSamples <- function(num, nfold) {
  # refer to cvsegments in 'pls'
  lengthOfsampleInfold <- ceiling(num / nfold)
  # Number of incomplete segments
  incomplete <- nfold * length.seg - num
  # Number of complete segments
  complete <- nfold - incomplete
  inds <- matrix(c(sample(1:num), rep(NA, incomplete)),
                 nrow = length.seg, byrow = TRUE)
  folds <- lapply(as.data.frame(inds), function(x) c(na.omit(x)))
  return(folds)
}



library(cvTools) 


 nfolds = 4
  dat<-read.table("final_scores.All.syn.txt")
  dat_pos<-dat[dat$V19==1,]
  dat_neg<-dat[dat$V19==0,]
  
  folds_pos <- cvFolds(nrow(dat_pos), nfolds)
  folds_neg <- cvFolds(nrow(dat_neg), nfolds)
    #dat <- as.data.frame(cbind(y, x))
  for (i in 1:nfolds) {
    idxTr_pos <- unlist(folds_pos[-i], use.names = FALSE)
    idxTe_pos <- unlist(folds_pos[i], use.names = FALSE)
    idxTr_neg <- unlist(folds_neg[-i], use.names = FALSE)
    idxTr_neg_sample <- unlist(sample(idxTr_neg[-i],length(idxTr_pos)), use.names = FALSE)
    idxTe_neg <- unlist(folds_neg[i], use.names = FALSE)
    idxTe_neg_sample <- unlist(sample(idxTe_neg[i],length(idxTe_pos)), use.names = FALSE)
    ## sample set
   train<- rbind(dat_pos[idxTr_pos, ], dat_neg[idxTr_neg_sample, ])
    test<- rbind(dat_pos[idxTe_pos, ], dat_neg[idxTe_neg_sample, ])
  
    name1<-paste0("train.",i,".txt")
    name2<-paste0("test.",i,".txt")
    write.table(train, file=name1, sep=" ",row.names=FALSE , col.names=FALSE, quote=FALSE)
    write.table(test, file=name2, sep=" ",row.names=FALSE , col.names=FALSE, quote=FALSE)
  }
  #return(predProbCV)
#}

  
  
  splitdf <- function(dataframe, seed=NULL) {
    if (!is.null(seed)) set.seed(seed)
    index <- 1:nrow(dataframe)
    trainindex <- sample(index, trunc(length(index)/2))
    trainset <- dataframe[trainindex, ]
    testset <- dataframe[-trainindex, ]
    list(trainset=trainset,testset=testset)
  }
  
  
  