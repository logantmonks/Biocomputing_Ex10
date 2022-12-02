#Biocomputing Exercise 10 12/1/22
#1. Generate a graph for UW vs. MSU
data<-read.table("UWvMSU_1-22-13.txt",header=TRUE)
#make the dataframe containing cumulative scores for each team everytime they score
game<-data.frame(matrix(ncol=3, nrow=0))
colnames(game)<-c("time","UW","MSU")
#create variables and set them to zero in order to keep track of the cumulative score
time<-0
UW<-0
MSU<-0
#loop through data with an if-else statement to differentiate when UW scores and when MSU scores 
for (i in 1:nrow(data)) {
  if (data$team[i] == 'UW'){
    UW=UW+data$score[i]
  } else if (data$team[i] == 'MSU') {
    MSU=MSU+data$score[i]
  }
  time=data$time[i]
  game[nrow(game) + 1,] <- c(time, UW, MSU)
}
#employ ggplot
ggplot() +
  geom_line(data = game, aes(x = time, y = MSU), color = "green") + 
  geom_line(data = game, aes(x = time, y = UW), color = "purple") + xlab("Time") +
  ylab("Score")+
  theme_classic()

#2. Game: Guess my number!
my_guess<-function(guess){
  number<-sample(1:100,1)
  if(guess<number){
    print("higher")
  }else if(guess>number){
    print("lower")
  }else{
    print("ding,ding,ding!")
  } 
}

