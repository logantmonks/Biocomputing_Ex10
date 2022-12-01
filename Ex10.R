#Question1
#Goal of project: Plot scores of each team over the course of the game

#basic plot requires data, aesthetic, and geom structure
#load data 
GameData<-read.table("UWvMSU_1-22-13.txt", header=TRUE, sep="",stringsAsFactors=FALSE)

# create variables to hold the team scores
sumUW<-0
sumMSU<-0

for(i in 1:nrow(GameData)){
  if(GameData$team[i]=="UW"){
    sumUW<-sumUW+GameData$score[i]
  
  }else{
    sumMSU<-sumMSU+GameData$score[i]
  }
}
#how do I get the score for every time increment to show up???!!!ask

ggplot(data=GameData, x="time", y="score")
#type of graph that we need
geom_smooth()

#Question2