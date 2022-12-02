#Biocomputing Exercise 10 - Patrick Bahk

#Part1
library(ggplot2)

game <- read.table(file="UWvMSU_1-22-13.txt", header=T, sep="\t")
scores <- data.frame(matrix(nrow=0, ncol=3))
colnames(scores) <- c("Time", "UW", "MSU")
uw_score <- 0
msu_score <- 0
time <- 0 
index <- 1

for (row in 1:nrow(game)){
  if (game$team[row] == "UW"){
    uw_score<-uw_score + game$score[row]
  }
  else {
    msu_score<-msu_score + game$score[row]
  }
  time<-game$time[row]
  
  scores[index,]<-c(time, uw_score, msu_score)
  
  index<-index + 1
}

plot_color<-c("UW" = "red", "MSU" = "blue")

ggplot() + 
  geom_line(data=scores, aes(x = Time, y = UW, color="UW")) + 
  geom_line(data=scores, aes(x = Time, y = MSU, color="MSU")) + 
  ylab("Score") + 
  xlab("Time") +
  scale_color_manual(values=plot_color) + 
  labs(color = "Teams")


#Part 2
number = sample.int(100,1)
num_guesses = 0
print("Guess a number between 1 and 100!")
while (num_guesses < 10){
  print("Guess: ")
  user_guess = as.integer(readline())
  if (user_guess == number){
    print("You got it!")
    break
  }
  else if (user_guess < number){
    print("Higher")
  }
  else if (user_guess > number){
    print("Lower")
  }
  num_guesses = num_guesses + 1
}

