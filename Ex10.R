#Question1
#Goal of project: Plot scores of each team over the course of the game

#basic plot requires data, aesthetic, and geom structure
#load data 
GameData<-read.table("UWvMSU_1-22-13.txt", header=TRUE, sep="",stringsAsFactors=FALSE)

# create variables to hold the team scores
sumUW<-0
sumMSU<-0

#Add the total/summed score at every time point for each team into the new vectors
for(i in 1:nrow(GameData)){
  if(GameData$team[i]=="UW"){
   sumUW[i+1]<-sumUW[i]+GameData$score[i]
   sumMSU[i+1]<-sumMSU[i]
    
    
  
  }else{
    sumMSU[i+1]<-sumMSU[i]+GameData$score[i]
    sumUW[i+1]<-sumUW[i]
  }
}

#Create a final data frame holding the time points and scores of each team at each time point
FinalData<-data.frame(time=c(0, GameData$time),MSUscore=sumMSU, UWscore=sumUW)
#Create line graph based on final data frame with x axis being time points and y axis being the score for each team at each time point that a team scores 
ggplot(data=FinalData, aes(x=time, y=UWscore))+
#specify type of graph that we need
#line graph to show scores throughout the game for each team(discrete)
  #teams labeled by color
geom_line(aes(x=time,y=UWscore,color="UW"))+
geom_line(aes(x=time,y=MSUscore,color="MSU"))+
  ylab("Scores")




#Question2
#
ComputerNumber<-sample(x=1:100,size=1)

word = readline(prompt="Guess")


Correct<-FALSE

  
for(i in 1:10){
  if(Correct==FALSE){
    #store guesses
    Answers<-as.numeric(readline(prompt="Guess"))
    #incorrect baseline
    #guess to begin with
    #keep guessing if wrong/until right
    
    
    if(Answers>ComputerNumber){
      print("lower")
    }else if(Answers<ComputerNumber){
      print("higher")
    }else if(Answers==ComputerNumber){
      print("Correct!")
      Correct==TRUE
    }
  }
  
  

}


#How do I only pick integers??
#How do I input guesses?
