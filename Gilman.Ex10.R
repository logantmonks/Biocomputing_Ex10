#set working directory
setwd("~/Desktop/biocomputing/Biocomputing_Ex10/")

scores <- read.delim("UWvMSU_1-22-13.txt", header = TRUE)

#Question 1

UWTotal=0
MSUTotal=0

for(i in 1:nrow(scores)){
  if(scores$team[i]=="UW"){
    UWTotal<-UWTotal+scores$score[i]
  }else{
    MSUTotal<-MSUTotal+scores$score[i]
  }
}

#the above just sums the cumulative score of each team
#I need a data frame of the cumulative score of each team at each time point

UWscores <- c(scores$score[scores$team=="UW"])
MSUscores <- c(scores$score[scores$team=="MSU"])

cumulative_score <- matrix(NA, nrow = nrow(scores)+1, ncol = 3) 
cumulative_score[,1] = c(0, scores[,1])
cumulative_score[1,] <- 0
colnames(cumulative_score) = c("Time", "UW", "MSU")
for(i in 1:nrow(scores)){
  if(scores$team[i]=="UW"){
    cumulative_score[(i+1),2]=cumulative_score[i,2] + scores$score[i] 
      cumulative_score[(i+1),3]=cumulative_score[i,3]
   
  }else{
    cumulative_score[(i+1),3]=cumulative_score[i,3] + scores$score[i] 
    cumulative_score[(i+1),2]=cumulative_score[i,2]
  }
}

matplot(x = cumulative_score[,1], y = cumulative_score[,2:3], type = 'l', xlab = "Time (min)" , ylab = "Score")


