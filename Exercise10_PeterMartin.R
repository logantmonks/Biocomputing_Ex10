# Exercise10_PeterMartin.R

setwd('~/Desktop/Rfiles/Biocomputing/Biocomputing_Ex10')

library(ggplot2)

## Question 1
# Using the score-by-score information from this game summarized in “UWvMSU_1-22-13.txt” 
# generate a graph similar to the one I show above. Don’t worry about how pretty your graph is. 
# Focus more on the control structures required in your script used to generate the plot.
UWvMSU<-read.table(file="UWvMSU_1-22-13.txt",header=TRUE)
UW<-UWvMSU
MSU<-UWvMSU

for(i in 1:nrow(UWvMSU)){
  if(UW$team[i]=="MSU"){
    UW$score[i]<-0
  }
  if(MSU$team[i]=="UW"){
    MSU$score[i]<-0
  }
}
for(i in 1:nrow(UWvMSU)){
  if(UWvMSU$team[i]=="UW"){
    UWvMSU$totalscore[i]=sum(UW$score[1:i])
  }else{
    UWvMSU$totalscore[i]=sum(MSU$score[1:i])
  }
}

ggplot(UWvMSU, aes(x=time,y=totalscore,color=team)) +
  geom_line() +
  ylab("Cumulative Score (points)") +
  xlab("Quarter") +
  scale_x_continuous(breaks = c(5, 15, 25, 35), labels= c("5" = "1st", "15" = "2nd", "25" = "3rd", "35" = "4th")) +
  theme_bw()

## Question 2
# Write a game called “guess my number”. The computer will generate a random number 
# between 1 and 100. The user types in a number and the computer replies “lower” if 
# the random number is lower than the guess, “higher” if the random number is higher, 
# and “correct!” if the guess is correct. The player can continue guessing up to 10 times.
GuessMyNumber=function(){
  Number<-sample(x=1:100, size=1)
  print("Pick a number!")
  for(i in 1:10){
    Input<-readline()
    Input<-as.numeric(Input)
    if(Input==Number){
      print("Correct!")
      break
      break
    }else if(Input<Number){
      print("higher")
    }else{
      print("lower")
    }
  }
}



