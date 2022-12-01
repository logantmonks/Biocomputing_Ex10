setwd("~/Desktop/Notre Dame/Courses S1/Biocomputing/R stuff/Biocomputing_Ex10")
library(ggplot2)

## PART ONE ##
# Data Processing 
scores <- read.table("UWvMSU_1-22-13.txt", header=TRUE)
MSU_data <- scores[scores$team=="MSU",]
UW_data <- scores[scores$team=="UW",]
MSU_scores <- MSU_data$score
UW_scores <- UW_data$score
cs_MSU <- vector("numeric",length=length(MSU_scores))
cs_UW <- vector("numeric",length=length(UW_scores))

# For loops to create cumulative sums for each team 
for (i in 1:length(MSU_scores)){
  cs_MSU[i] <- sum(MSU_scores[1:i])
}
for (i in 1:length(UW_scores)){
  cs_UW[i] <- sum(UW_scores[1:i])
}    

# Combining the cumulative scores into one dataframe 
df_UW <- data.frame(time=UW_data$time, team=UW_data$team, score=UW_data$score, cs=cs_UW)
df_MSU <- data.frame(time=MSU_data$time, team=MSU_data$team, score=MSU_data$score, cs=cs_MSU)
both <- rbind(df_UW, df_MSU)

# Making the ggplot (output)
ggplot(both, aes(x=time, y=cs, group=team)) + geom_line(aes(color=team)) 

## PART TWO ##
numbergame <- function(Guess){
  number <- sample(1:100,1)
  totalguesses <- 0
  numberguesses <- 10
  Guess <- readline(prompt="Guess:")
  for (i in 1:numberguesses){
    if (totalguesses<numberguesses){
      if (Guess < number){
        print("Higher")
        tryagain <- readline("Guess:")
        Guess <- as.numeric(tryagain)
        totalguesses <- totalguesses + 1
      }else if(Guess > number){
        print("Lower")
        tryagain <- readline("Guess:")
        Guess <- as.numeric(tryagain)
        totalguesses <- totalguesses + 1
      }else if (Guess == number){
     return("Correct!")
    }
  }
}
}

numbergame()
