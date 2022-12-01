##### Biocomputing Exercise 10 
##### Isaac Loutzenhiser

#### Question 1

### Uploading the data from a text file and display the results of the game on a plot
scores<-read.table("UWvMSU_1-22-13.txt", header = TRUE, sep = "\t")

### Due to the fact that this is in a data frame, we need to convert it as a matrix; I simply copied the same format as the data frame; however, I made it into a matrix.    
scores2 <-matrix(0,nrow=51,ncol=3)
colnames(scores2)<-c("Time", "UW Score","MSU Score")

### Generating a for loop and an if statement; this will help seperate the two teams and their scores
for (i in 1:nrow(scores)){
  if(scores$team[i]=="UW"){
    scores2[(i+1),2]<-scores2[i,2]+scores[i,3]
    scores2[(i+1),3]<-scores2[i,3]
    scores2[i+1,1]<-scores[i,1]
  }else{
    scores[(i+1),3]<-scores[i,3]+scores[i,3]
    scores[(i+1),2]<-scores[i,2]
    scores[i+1,1]<- scores[i,1]
  }
}


### Plotting the data; command plot() will generate a line series graph 
plot(scores2[,1],scores2[,2], col="blue", type="l",
     xlab = "Time", ylab = "Score", ylim = c(0,50),)
legend('bottomright',c('UW','MSU'),lwd=1,col=c('blue','darkgreen'),box.lty=0)
lines(scores[,1],scores[,3], col="darkgreen")



#### Question 2 Guess my number 
randomN <- sample(100,1)
for (i in 1:10) {
  guess <- readline(promt="Random number 1-100:")
  if(guess==randomN){
    print("Correct"){
    }else if(guess>randomN){
      print("Too high")
      {else if (guess<randomN){
        print("Too low")
      }
      }
      