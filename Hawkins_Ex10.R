## Exercise 10 Hawkins

##The plot that depicts the score from the UW vs MSU game
results <- read.table("UWvMSU_1-22-13.txt", header = TRUE, sep = "\t")##Upload the file that contains the scores
score_time<-results[,1] ## Creates a vector that is the first column of the data frame "results"
score_length<-length(score_time) ## creates a variable that contains the length of the previously made vector
scores<-data.frame(
  time=score_time,
  uwscore=numeric(score_length),
  msuscore=numeric(score_length))## Creates the data frame that will be used for the remainder of the problem that gives scores for each team at instances in which there was a score change

##This is the for loop that utilizes an if/else statement that fills in the scores data frame with information from the results data frame based upon which team scores and when in the game that the team did score 
for (i in 1:nrow(results)){
  if(results$team[i]=="UW"){
    scores[(i+1),2]<- scores[i,2]+results[i,3]
    scores[(i+1),3]<- scores[i,3]
    scores[i+1,1]<-results[i,1]
  }else{
    scores[(i+1),3]<- scores[i,3]+results[i,3]
    scores[(i+1),2]<- scores[i,2]
    scores[i+1,1]<-results[i,1]
  }
}
## Creates the plot that shows the change in score over the course of the game.
ggplot()+
  geom_line(data=scores, aes(x=time, y=msuscore, color="MSU" ))+
  geom_line(data=scores, aes(x=time, y=uwscore, color="UW"))+
  ylab("Score")+
  xlab("Time (in minutes)")+
  theme_classic()


##NumberGuessingMachine
randomNumber<-sample(100,1) #Picks a random number between 1 and 100
for(i in 1:10){ ##The portion of the code that only allows for 10 guesses
  guess<-readline(prompt="Guess a number 1-100:   ")
  if(guess==randomNumber){
    print("Correct!!")
  }else if(guess>randomNumber){
    print("Too High")
  }else if(guess<randomNumber){
    print("Too Low")
  }
  }
