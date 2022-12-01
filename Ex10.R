#Question1
#Goal of project: Plot scores of each team over the course of the game

#basic plot requires data, aesthetic, and geom structure
#load data 
GameData<-read.table("UWvMSU_1-22-13.txt", header=TRUE, sep="",stringsAsFactors=FALSE)

# create variables to hold the team scores
sumUW[1]<-0
sumMSU[1]<-0


for(i in 1:nrow(GameData)){
  if(GameData$team[i]=="UW"){
   sumUW[i+1]<-sumUW[i]+GameData$score[i]
   sumMSU[i+1]<-sumMSU[i]
    
    
  
  }else{
    sumMSU[i+1]<-sumMSU[i]+GameData$score[i]
    sumUW[i+1]<-sumUW[i]
  }
}

FinalData<-data.frame(time=c(0, GameData$time),MSUscore=sumMSU, UWscore=sumUW)
#how do I get the score for every time increment to show up???!!!ask

ggplot(data=FinalData, aes(x=time, y=UWscore))+
#type of graph that we need
geom_line(aes(x=time, y=UWscore))+
geom_line(aes(x=time, y=MSUscore))
#Question2

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
