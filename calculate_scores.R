calculate_scores<- function (array1, dataframe1) {
  score<-{}
    for(k in 1:length(array1)){
      sub1<-FP_all[as.character(FP_all$V1) %in% as.character(dataframe1[dataframe1$V2==array1[k], 1]),2:ncol(FP_all) ]
      
      sub1<-rbind(sub_drug, sub1) # first row is sub_drug's fp
      sub1<-data.matrix(sub1, rownames.force = NA)
      
      score1={}
      if(!is.null(nrow(sub1) )){
        if(nrow(sub1) > 1){
          score1<- compute_str_similarity_max(sub1)  
        }else{
          score1<--10
        }
      }else{
        F15=c(-10,-10,-10,0)
      }
      score<-c(score,score1)
    } # k-loop
    score=score[score!=-10]
    if(length(score)> 1){
      F15=c(max(score), median(score), mean(score),length(score[score > CUTOFF])/length(score))
    }else if(length(score)==1){
      if(score > CUTOFF){
        F15=c(score, score, score, 1.1)
      }else{
        F15=c(score, score, score, 0)
      }
    }else{
      F15=c(-10,-10,-10,0)
    }
    return(F15)
}