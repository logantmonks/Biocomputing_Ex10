# Brandon Barnacle
# Exercise 10

# load in ggplot
library(ggplot2)

# Problem 1

# read in the data
scores<-read.table("UWvMSU_1-22-13.txt", header=TRUE, sep="\t")

# set up a data frame that has a column for the time and then each teams score
# at the time
scores_df<-data.frame(matrix(nrow=0, ncol=3))
colnames(scores_df)<-c("Time", "UW", "MSU")

# create variables to keep track of each teams score and the time
score_uw<-0
score_msu<-0
the_time<-0

# keep track of which index in df we are at
index<-1

# loop through the data we read in, and increase the teams score when we see it
for (row in 1:nrow(scores)){
  # we find the UW scored, so increase their score
  if (scores$team[row] == "UW"){
    score_uw<-score_uw + scores$score[row]
  }
  # if it was not UW, then it was MSU who scored
  else {
    score_msu<-score_msu + scores$score[row]
  }
  # set the time
  the_time<-scores$time[row]
  
  # add the values to the df
  scores_df[index,]<-c(the_time, score_uw, score_msu)
  
  # increase index
  index<-index + 1
}

# create the plot

# an array for the colors
plot_color<-c("UW" = "red", "MSU" = "green")

ggplot() + 
  geom_line(data=scores_df, aes(x = Time, y = UW, color="UW")) + 
  geom_line(data=scores_df, aes(x = Time, y = MSU, color="MSU")) + 
  ylab("Score") + 
  xlab("Time") +
  scale_color_manual(values=plot_color) + 
  labs(color = "Teams")

# problem 2

# create a variable to keep track of guesses
guesses<-0

# get the random number
number_arr<-1:100
random_num<-sample(number_arr, size=1)

print("Welcome to Guess My Number")
print("I'm thinking of a number 1-100...")

# create a while loop for while guesses < 10 
while (guesses < 10){
  # prompt user for guess
  print("Guess: ")
  user_guess<-readline()
  
  # convert input to int
  user_guess<-as.integer(user_guess)
  
  # check if higher, lower, or equal
  if (user_guess == random_num){
    print("Correct!")
    break
  }
  else if (user_guess < random_num){
    print("Higher")
  }
  else{
    print("Lower")
  }
  
  # increases guesses
  guesses<- guesses + 1
}

# if they took 10 guesses, they lost, so reveal number
if (guesses == 10){
  print("You took too many guesses!")
  cat("The number was: ",random_num)
}
