setwd("~/Desktop/BCTutorials/Biocomputing_Ex10/")
#1
#load ggplot
library(ggplot2)
#import score information
rawdata <- read.table("UWvMSU_1-22-13.txt",header = TRUE, sep = "\t")
#separate score information for each team
MSUdata <- rawdata[grepl("MSU",rawdata$team),]
UWdata <- rawdata[grepl("UW",rawdata$team),]
#make a column of cumulative score for each team's dataframe
MSUdata[,"cumscore"] <- cumsum(MSUdata$score)
UWdata[,"cumscore"] <- cumsum(UWdata$score)
#plot both dataframes on the same plot using time as the x axis and cumulative score as the y
ggplot() + 
  geom_line(data = MSUdata, aes(x = MSUdata$time, y = MSUdata$cumscore), color = "darkgreen") +
  geom_line(data = UWdata, aes(x = UWdata$time, y = UWdata$cumscore), color = "red") +
  xlab('Time (min)') +
  ylab('Score')

#2
#name the game and make it so that there is no input with the game title
guessmynumber <- function() {
  #creation of a correct answer
  solution <- sample(1:100, 1)
  #when the new custom function is used, the game premise is explained and a guess is prompted
  print("I'm thinking of a number 1-100...")
  guess <- readline("Guess:")
  #a counter is created to limit the number of guesses using "while"
  counter <- 1
  while(counter < 10) {
    #different suggestions are printed based on if the guess is higher or lower
    #if the answer is not correct, player is prompted to guess again
    #counter goes up one for every incorrect guess
    #if the guess is correct, the game tells you so and stops
    if (guess < solution) {
      print("Higher...")
      newguess <- readline("Guess again:")
      guess <- as.numeric(newguess)
      counter <- counter + 1
    } else if (guess > solution) {
      print("Lower...")
      newguess <- readline("Guess again:")
      guess <- as.numeric(newguess)
      counter <- counter + 1
    } else if (guess == solution) {
      print("Correct!")
      stop()
    }
  }
  #on the tenth guess, it is the player's last try
  #if it is wrong it tells the player that they have used all guesses and shows the correct answer
  if (guess == solution) {
    print("Correct!")
    }else if (guess != solution) {
      print("You've run out of guesses! The answer was")
  print(solution)
    }
}