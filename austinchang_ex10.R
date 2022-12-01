# Exercise 10
# this script must be run in Biocomputing_Ex10 directory

library(ggplot2)

# problem 1

table = read.table('UWvMSU_1-22-13.txt', header = TRUE)
df <- data.frame(matrix(ncol = 3, nrow = 0))
colnames(df) <- c('Time', 'UW', 'MSU')

UW = 0
MSU = 0

for (row in 1:nrow(table)){
  if (table$team[row] == 'UW'){
    UW = UW + table$score[row]
  }
  else if (table$team[row] == 'MSU'){
    MSU = MSU + table$score[row]
  }
  Time = table$time[row]
  df[nrow(df) + 1,] <- c(Time, UW, MSU)
}

colors <- c("UW" = "red", "MSU" = "blue")
ggplot() +
  geom_line(data = df, aes(x = Time, y = UW, color = "UW")) + 
  geom_line(data = df, aes(x = Time, y = MSU, color = "MSU")) + 
  ylab("Score") +
  scale_color_manual(values = colors)

# problem 2

sample_num = sample.int(100,1)
num_guesses = 0
print("Guess a number between 1 and 100!")
while (num_guesses < 10){
  print("Guess: ")
  user_guess = as.integer(readline())
  if (user_guess == sample_num){
    print("You win!")
    break
  }
  else if (user_guess < sample_num){
    print("Higher")
  }
  else if (user_guess > sample_num){
    print("Lower")
  }
  num_guesses = num_guesses + 1
}
