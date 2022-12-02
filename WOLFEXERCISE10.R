#Biocomputing Exercise 10 Wolf

#Setwd
setwd('~/Biocomputing_Ex10')
#Load libraries
library(ggplot2)

#Q1. Generate a graph similar to the one shown depicting the cumulative score for each team as a function of time in the game. Don't
#worry about how pretty your graph is, focus more on the control structures required in your script used to generate the plot

#Load text file
gameScores<-read.table("UWvMSU_1-22-13.txt",header = TRUE)

#Create data frame
scoresOverTime<-data.frame("Time"=gameScores$time, "Team"=gameScores$team, "Scores"= gameScores$score)
scoresOverTime[,"cumulativeScore"]<-cumsum(gameScores$scores)

for (team in gameScores) {
  cmScore<-cumsum(gameScores$score)
  scoresOverTime$cumulativeScore<-(as.numeric(cmScore))
  
}

#Generate graph
ggplot(data = scoresOverTime, aes(x=Time,y=cumulativeScore,col=Team)) + geom_line()


#Q2. Write a game called "guess my number". The computer will generate random numbers between 1 and 100.
#The user types in a number, and the computer replies lower, if the number is lower than the guess, higher if higher than the guess, and correct if the guess is correct
#The player can guess up to ten times
#TIPS: look at Input/Output reference given, sample() is a function that allows for random selection from a vector containing a set of integers
guessingGame<-c(1:100)
magicNumber<-sample(guessingGame,1)
guess<-c("32") #for example

#function//if-else
interactionResults<-function(guess)
  
if (guess>magicNumber){
  print("Lower")
 } else (guess<magicNumber){
  print("Higher")
}else (guess=magicNumber){
  print("You got it!")
}

#make for loop to limit guess number to ten guesses
for (guess in 1:10) {
  print(interactionResults)
}

