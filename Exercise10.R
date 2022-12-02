# Exercise 10
# Fabely Moreno

# set working directory and load libraries):
setwd("C:/Users/fabel/Biocomputing_Ex10")
library(ggplot2)

# Problem 1:
UWvMSU <- read.table(file= "UWvMSU_1-22-13.txt", header=TRUE)

scoreUW <- numeric(length(UWvMSU$time))
scoreMSU <- numeric(length(UWvMSU$time))


for(i in 1:nrow(UWvMSU)){
  if(i==1){
    if(UWvMSU$team[i]=="MSU"){
      scoreMSU[i]<- UWvMSU$score[i]
    }else if(UWvMSU$team[i]=="UW"){
      scoreUW[i] <- UWvMSU$score[i]
    }
  }
  if(i > 1){
    if(UWvMSU$team[i]=="UW"){
      scoreUW[i] <- scoreUW[i-1] + UWvMSU$score[i]
      scoreMSU[i] <- scoreMSU[i-1]
    }else if(UWvMSU$team[i]=="MSU"){
     scoreMSU[i] <- scoreMSU[i-1] + UWvMSU$score[i]
     scoreUW[i] <- scoreUW[i-1]
    }
  }
}


scoresbyQT <- numeric(length(UWvMSU$time))

for(i in 1:nrow(scores)){
  if(scores$time[i]<= 10){
    scoresbyQT[i] <- "1st"
  }else if(scores$time[i]<=20){
    scoresbyQT[i] <- "2nd"
  }else if(scores$time[i]<=30){
    scoresbyQT[i] <- "3rd"
  }else{
    scoresbyQT[i] <- "4th"
  }
}

scores <- data.frame(time = UWvMSU$time,UW = scoreUW, MSU = scoreMSU, Quarter = scoresbyQT)

# Plot time vs Scores:
plot(x = scores$time, y = scores$UW, xaxt = "n",yaxt = "n", ylab = "", xlab = "", type = "l", col = "red")
lines(scores$time, scores$MSU, col="blue")
axis(side = 4, at=pretty(scores$UW))
axis(side=1, at = c(10,20,30,40), labels=c("1st", "2nd", "3rd", "4th"))

# Problem 2

random_number <- sample(1:100, 1)
guess <- c(0,0,0,0,0,0,0,0,0,0)
#start game:

for(i in 1:length(guess)){
  if(i == 1){
    print("Im thinking of a number 1-100...")
    guess[i] <- as.integer(readline(prompt = "Enter your guess: "))
  }
  if(guess[i] < random_number){
    print("Higher")
  }else if(guess[i] > random_number){
    print("Lower")
  }else if(guess[i]== random_number){
    print("Correct!")
    break
  }else {
  }
  if(i == 10){
    print("Game over!")
    break
  }
  guess[i+1] <- as.integer(readline(prompt = "Enter your guess: "))
}

