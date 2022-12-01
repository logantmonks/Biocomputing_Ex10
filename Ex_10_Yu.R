library(ggplot2)
setwd("/Users/zhuoranyu/Biocomputing_Ex10")
game <-read.table("UWvMSU_1-22-13.txt", header=TRUE, sep="\t", stringsAsFactors=FALSE)

head(game)

#create four new columns to store data
game$UWscore=0
game$MSUscore=0
game$UWsum=0
game$MSUsum=0

#make two columns with only team scores
for (i in 1:nrow(game)){
  if (game$team[i] == "UW"){
    game$UWscore[i]= game$score[i]
    game$UWsum[i]=sum(game$UWscore[1:i])
  } else {
    game$MSUscore[i]= game$score[i]
    game$MSUsum[i]=sum(game$MSUscore[1:i])
  }}

#put the score before in the row when the team is not scoring
for (i in 2:nrow(game)){
  if (game$UWsum[i]==0){
    game$UWsum[i]=game$UWsum[i-1]
  }}

for (i in 2:nrow(game)){
  if (game$MSUsum[i]==0){
    game$MSUsum[i]=game$MSUsum[i-1]
  }}

#add in 0 at the beginning to be more accruate
game[1+nrow(game),] = c(3,0,0,0,0,0,0)
game[1+nrow(game),] = c(2,0,0,0,0,0,0)
game[1+nrow(game),] = c(1,0,0,0,0,0,0)
game[1+nrow(game),] = c(0,0,0,0,0,0,0)

ggplot(game, aes(x= time, y = "")) + 
  geom_line(aes(y = UWsum, col = "UW")) + 
  geom_line(aes(y = MSUsum, col = "MSU"))+
  theme_bw() +
  xlab("Time") +
  ylab("score")+
  theme(legend.title=element_blank())+
  scale_x_continuous(limits = c(0,40),
                     expand = c(0,0),
                     n.breaks = 5,
                     labels = c("0","1st","2nd","3rd","4th"))


guess_my_number <- function(){
  number <-sample(1:100,1) #randomly draw a number from 1-100
  print("I'm thinking of a number 1-100...",quote=F)
  for (i in 1:10){
    guess <- readline(prompt='Guess: ')
    guess <- as.integer(guess)
    if (i < 10 &guess<number){
      print("higher",quote=F)} else
        if (i < 10 &guess>number){
          print("lower",quote=F)} else
            if (i < 10 & guess==number){
              print("correct!",quote=F)
              break}
    if (i == 10 & guess!=number){
      print(c("You used up all your guesses, the number is", number),quote=F)
    }
  }
}

guess_my_number()