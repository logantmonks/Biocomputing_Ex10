# Ex10.R: A script to execute the problems outlined by Exercise 10
# Assume you are in the Biocomputing_Ex10 directory

# 1: Make a plot of the UW vs MSU score as a function of time
# First need to access the data
scores <- read.table("UWvMSU_1-22-13.txt", header=TRUE)
# Make data frame for the scores
df <- data.frame(Time, UWScore, MSUScore)

#Set initial Values for the variables
Time = 0
UWScore = 0
MSUScore= 0

# Run a for loop to add up scores throughout the game
for (x in 1:nrow(scores)){
  if (scores$team[x] == "UW"){
    UWScore = scores$score[x] + UWScore
  } else{
    MSUScore = scores$score[x] + MSUScore
  }
  Time = scores$time[x]
  df[nrow(df) + 1,] <- c(Time, UWScore, MSUScore)
}

# Load the ggplot and cowplot packages
library(ggplot2)
library(cowplot)

# makes the line plot to show scores throughout the game
ggplot(data = df, aes(x = Time)) +
  geom_line(aes(y = UWScore), color = "red") +
  geom_line(aes(y = MSUScore), color = "green") +
  theme_classic() +
  ylab("Score") 
  
# 2: Create a Game to guess a random number

#First generate a random integer 1:100
numb <- floor(runif(1, min = 1, max =100))
# Print the starting line
print("I'm thinking of a number 1-100...")
# create a for loop 1-10 to allow for 10 tries at the game
# use if else statements to compare the input to the random number
for (i in 1:10){
  print("Guess: ")
  guess = readline();
  guess = as.integer(guess);
  if(guess > numb){
    print("Lower")
    next;
  }else if(guess < numb){
    print("Higher")
    next;
  }else if(guess == numb){
    print("Correct!")
    break;
  }
}

#Done





