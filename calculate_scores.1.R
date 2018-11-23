calculate_scores_1 <- function (var1){
  
  sub1<-FP_all[as.character(FP_all$V1) %in% as.character(var1), 2:ncol(FP_all)]
  sub1<-rbind(sub_drug, sub1) # first row is sub_drug's fp
  sub1<-data.matrix(sub1, rownames.force = NA)
  
  if(!is.null(nrow(sub1))){
    if(nrow(sub1) > 1){
      Fb <- compute_str_similarity(sub1, CUTOFF)  
    }else{
      Fb <- c(-10,0)
    }
  }else{
    Fb <- c(-10,0)
  }
  return(Fb)
}