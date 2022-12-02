#Liv Maracina 
#Ex10

#Question 1
 rawdata = read.table("~/Biocomputing_Ex10/UWvMSU_1-22-13.txt", header = TRUE)
 df <-- data.frame(matrix(ncol = 3, nrow =0))
 colnames(df) <- c('time', 'UW_Score', 'MSU_Score')
 
   UW_score = 0
 MSU_score = 0
 
   for (i in 1:nrow(rawdata)) {
     if (rawdata$team[i] == 'UW'){
       UW_score = UW_score + rawdata$score[i]
     } else {
       MSU_score = MSU_score + rawdata$score[i]
   }
     time = rawdata$time[i]
     df[nrow(df) + 1,] <- c(time, UW_score, MSU_score)
   }

   ggplot() +
     geom_line(data = df, aes(x = time, y = UW_Score), color = "red") +
     geom_line(data = df, aes(x = time, y = MSU_Score), color = "green") +
     theme_classic()

#Question 2 

 random_num = sample.int(100,1)
 print("I'm thinking of a random number btw 1 and 100...")
#User will get 1-10 guesses
 for (i in 1:10) 
     print("Guess: ")
     guess = read.line();
     guess = as.integer(guess);
     if (guess == random_num) {
       print == ("Correct!")
       break
     } else if (guess > random_num){
       print("lower")
     } else if (guess > random_num){
      print ("higher")
     }

