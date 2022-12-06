# First Problem
library(ggplot2)


#ggplot(data=UWvMSU_1.22.13_new_data, aes(x=time, y=score)) + geom_line()
# 23 of UW & 27 of MSU

UW_data <- data.frame(dim=c(50, 2))
MSU_data <- data.frame(dim=c(50, 2))

for (row in 1:50) {
  team_interest = UWvMSU_1.22.13_new_data[row, 2]
  if(team_interest == "UW"){
    UW_data[row, 1] = UWvMSU_1.22.13_new_data[row, 1]
    UW_data[row, 2]= UWvMSU_1.22.13_new_data[row, 3]
  }
  else{
    MSU_data[row, 1] = UWvMSU_1.22.13_new_data[row, 1]
    MSU_data[row, 2]= UWvMSU_1.22.13_new_data[row, 3]
  }
}
end

colnames(UW_data) <- c('Time' , 'Score')
colnames(MSU_data) <- c('Time' , 'Score')

ggplot() + 
  geom_point(data = UW_data, aes(x= Time, y=Score), color="red") +
  geom_point(data = MSU_data, aes(x=Time, y=Score), color="green") + 
  geom_smooth(method=lm)
#Find way to plot from both data arrays


#Second Problem 
Random_Number=sort(sample.int(100, 1))
print("I am guessing a number between 1-100")

for (guesses in 1:10){
Guess = readline(prompt="Guess..")
if(Guess<Random_Number){
  print("Higher")
}
else if(Guess>Random_Number){
  print("Lower")
} 
else if(Guess == Random_Number){
  print("Correct guess! Good job!")
  break
}
print("Guess again!")
}

print(paste0("Ran out of opportunities! The number was: ",Random_Number))

