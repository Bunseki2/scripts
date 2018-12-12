unlink(".RData") 
library(caret)
library(ROCR)
require(plyr)

compute_auc <- function(A,B, mod){
        preProcValues <- preProcess(A, method = c("center", "scale"))
        newdata <- predict(preProcValues, A)
        pred <- predict(mod$finalModel, newdata=newdata,type="response")
        pred1 <- prediction(as.numeric(pred), as.numeric(B))
        perf <- performance(pred1,"tpr","fpr")
        auc <- performance(pred1, "auc")@y.values[[1]]
        return(auc)
}


generateFolds <- function(x,k){
    n <- nrow(x)
    x$folds <- rep(1:k,length.out = n)[sample(n,n)]
    x
}


set.seed(1)
final_score_max_exist_onezero_harm_all <- read.table("all.finalscore.06142017.max.Updnexist.one_zero.harm.txt",header=FALSE, sep=" ")
final_score_max_exist_onezero_harm_for_1to1 <- final_score_max_exist_onezero_harm_all[final_score_max_exist_onezero_harm_all$V16==1,]
n_harm <- nrow(final_score_max_exist_onezero_harm_for_1to1)
final_score_max_exist_onezero_no_harm <- final_score_max_exist_onezero_harm_all[final_score_max_exist_onezero_harm_all$V16==0,]
final_score_max_exist_onezero_no_harm_for1_to1 <- final_score_max_exist_onezero_no_harm[sample(1:nrow(final_score_max_exist_onezero_no_harm), n_harm, replace=FALSE, ), ]
final_score_max_exist_onezero_harm_121 <- rbind(final_score_max_exist_onezero_harm_for_1to1, final_score_max_exist_onezero_no_harm_for1_to1)

times=1 # number of times to select no_harm and make 121
rep=100 # number of repetition of fold-cv
fold=10 # 


meanK <- c()
meanK2 <- c()
meanK3 <- c()
anova_pr <- c()
anova_deviance <- c()
anova_pr2 <- c()
anova_deviance2 <- c()

#for(k in 1:times){
        final_score_max_exist_onezero_no_harm_for1_to1 <- final_score_max_exist_onezero_no_harm[sample(1:nrow(final_score_max_exist_onezero_no_harm), n_harm, replace=FALSE, ), ]
        final_score_max_exist_onezero_harm_121<-rbind(final_score_max_exist_onezero_harm_for_1to1, final_score_max_exist_onezero_no_harm_for1_to1)
        meanJ <- c()
        meanJ2 <- c()
        meanJ3 <- c()
	for (j in 1:rep) {     
                folds <- ddply(final_score_max_exist_onezero_harm_121, .(V16),generateFolds,k = fold)
                auc <- c()
		auc2 <- c()
		auc3 <-c()
                for (i in 1:fold) { 
                        test <- folds$folds==i
                        test_set <- folds[test,]
                        train_set <- folds[(!test),]
                        A <- train_set[,c(3,8,9,12,13,14,15)]
                        B <- train_set[ ,16]
                        mod <- train(A,B,method="glm",trControl=trainControl(method="none"), preProcess=c("center","scale"),family= "binomial")
                        A <- test_set[,c(3,8,9,12,13,14,15)]
                        B <- test_set[ ,16]
                        auc <- c(auc,compute_auc(A,B, mod))

			A <- train_set[,c(3,8,9,12,14)]
                        B <- train_set[ ,16]
                        mod3 <- train(A,B,method="glm",trControl=trainControl(method="none"), preProcess=c("center","scale"),family= "binomial")
                        A <- test_set[,c(3,8,9,12,14)]
                        B <- test_set[ ,16]
                        auc3 <- c(auc,compute_auc(A,B, mod3))


			A <- train_set[,c(3,4,5,6,7,8,9)]
                        B <- train_set[ ,16]
                        mod2 <- train(A,B,method="glm",trControl=trainControl(method="none"), preProcess=c("center","scale"),family= "binomial")
                        A <- test_set[,c(3,4,5,6,7,8,9)]
                        B <- test_set[ ,16]
                        auc2 <- c(auc,compute_auc(A,B, mod2))

			anova<-anova(mod$finalModel, mod2$finalModel, test="Chisq")
			anova_pr <- c(anova_pr, anova$"Pr(>Chi)"[2])
			anova_deviance <- c(anova_deviance, anova$Deviance[2])

                        anova2<-anova(mod3$finalModel, mod2$finalModel, test="Chisq")
                        anova_pr2 <- c(anova_pr2, anova2$"Pr(>Chi)"[2])
                        anova_deviance2 <- c(anova_deviance2, anova2$Deviance[2])



                }
                print(auc)
                print(mean(auc))
                print(sd(auc))
		meanJ <- c(meanJ, mean(auc))

                print(auc2)
                print(mean(auc2))
                print(sd(auc2))
		meanJ2 <- c(meanJ2, mean(auc2))
	
		print(auc3)
                print(mean(auc3))
                print(sd(auc3))
                meanJ3 <- c(meanJ3, mean(auc3))

        }

        meanJ
        mean(meanJ) 
        sd(meanJ)
        meanK <-c(meanK, mean(meanJ))

        meanJ2
        mean(meanJ2)
        sd(meanJ2)
        meanK2 <-c(meanK2, mean(meanJ2))

        meanJ3
        mean(meanJ3)
        sd(meanJ3)
        meanK3 <-c(meanK3, mean(meanJ3))

	anova_pr
	anova_deviance

	anova_pr2
        anova_deviance2



#}
#meanK
#mean(meanK)
#sd(meanK)

#meanK2
#mean(meanK2)
#sd(meanK2)

#mean(anova_pr)
#mean(anova_deviance)
