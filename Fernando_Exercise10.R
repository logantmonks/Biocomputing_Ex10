setwd("~/Desktop/Biocomputing /Exercises/Biocomputing_Ex10")

#Question 1
#load the data file
basketball <- read.table("UWvMSU_1-22-13.txt",header=TRUE,sep="\t")

CumulativeScore <- 0

#made a new column for store the cumulative scores
CumulScore<- rep(NA,dim(basketball)[1])

#bind the new column to data
basketball <- cbind(basketball,CumulScore)

#cumulative scores for UW
for (i in 1:sum(basketball$team=="UW")){
  CumulativeScore <- CumulativeScore + basketball$score[which(basketball$team=="UW")][i]
  basketball$CumulScore[which(basketball$team=="UW")][i] <- CumulativeScore
}

#cumulative scores for MSU
CumulativeScore <- 0
for (i in 1:sum(basketball$team=="MSU")){
  CumulativeScore <- CumulativeScore + basketball$score[which(basketball$team=="MSU")][i]
  basketball$CumulScore[which(basketball$team=="MSU")][i] <- CumulativeScore
}

#plot 
plot(y=basketball$CumulScore[which(basketball$team=="MSU")],x=basketball$time[which(basketball$team=="MSU")],type="l", xlab="Time",ylab="Score",col="blue")
lines(y=basketball$CumulScore[which(basketball$team=="UW")],x=basketball$time[which(basketball$team=="UW")])

#Question 2

Guess_my_number <- function(){
  my_number <-sample(1:100,1) 
  print("I'm thinking of a number 1-100...",quote=F)
  for (j in 1:10){
    Guess <- readline(prompt='Guess: ')
    Guess <- as.integer(Guess)
    if (j < 10 &Guess>my_number){
      print("Lower",quote=F)} else
        if (j < 10 &Guess<my_number){
          print("Higher",quote=F)} else
            if (j < 10 & Guess==my_number){
              print("Correct!",quote=F)
              break}
    if (j == 10 & Guess!=my_number){
      print("Game Over!",quote=F)
    }
  }
}

Guess_my_number()

