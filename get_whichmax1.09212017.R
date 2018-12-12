get_whichmax1.1 <- function (var1,var2, dataframe1){
  
  sub1<-FP_all[as.character(FP_all$V1) %in% as.character(var1), 2:ncol(FP_all)]
  sub1<-rbind(sub_drug, sub1) # first row is sub_drug's fp
  sub1<-data.matrix(sub1, rownames.force = NA)
  
  if(!is.null(nrow(sub1))){
    if(nrow(sub1) > 1){
      Fm <- compute_str_similarity_whichmax(sub1)  
      ##trace_back
      sub2<-FP_all[as.character(FP_all$V1) %in% as.character(var1) ,]
      max_drug<-sub2[Fm[2],1]
      The_target_of_max_drug<-dataframe1[dataframe1$V1==as.character(max_drug),2]
      #The_target_of_max_drug<-phys_interacts2Uniprot[phys_interacts2Uniprot$V2 %in% target_of_max_drug,2]
      max_drug_Fm<-max_drug
      
      The_target_of_max_drug2<-c(as.character(The_target_of_max_drug[1]))
      if(length(The_target_of_max_drug)>1){
        for(j in 2:length(The_target_of_max_drug)){
          The_target_of_max_drug2<-c(The_target_of_max_drug2, as.character(The_target_of_max_drug[j]))
        }
      }
      target_of_max_drug <-The_target_of_max_drug2[as.character(The_target_of_max_drug2) %in% as.character(var2[,2])]
      #print(target_of_max_drug)
    }else{
      max_drug_Fm <- "NA"
      target_of_max_drug<-"NA"
    }
  }else{
    max_drug_Fm <- "NA"
    target_of_max_drug<-"NA"
  }
  
  return(cbind(as.character(max_drug_Fm),target_of_max_drug))
}
