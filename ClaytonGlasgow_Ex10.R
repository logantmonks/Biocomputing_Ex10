## Intro to Biocomputing Exercise 10
## Clayton Glasgow
## 18 November 2022

# problem 1: plotting cumulative score

# load data
bball <- read.table("UWvMSU_1-22-13.txt", sep = "", header = TRUE)

# generate dataframe with cumulative score for each team 
cumulative_score <- matrix(NA, nrow = nrow(bball) + 1, ncol = 3)
# assign first column as time
cumulative_score[,1] <- c(0, bball$time)
# assign first row as equal to 0
cumulative_score[1,2:3] <- 0
# name columns
colnames(cumulative_score) <- c("time", "MSU", "UW")
# run for loop calculating cumulative score, maintaining score the same if the other team scores
for(i in 1:nrow(cumulative_score)){
  if(bball$team[i] == "MSU"){
    cumulative_score[(i+1),2] = bball$score[i] + cumulative_score[i,2] # MSU cumulative score
    cumulative_score[(i+1),3] = cumulative_score[i,3] # if MSU scores, UW score doesn't change
  } else{cumulative_score[(i+1),3] = bball$score[i] + cumulative_score[i,3] # UW cumulative score
  cumulative_score[(i+1),2] = cumulative_score[i,2]} # if UW scores, MSU score doesn't change
}

# convert matrix to data frame
cumulative_score <- as.data.frame(cumulative_score)

# convert to long format for plotting
cumulative_long <- gather(cumulative_score, Team, score, MSU:UW)

# plot results (long data)
ggplot(cumulative_long, aes(x = time, y = score, color = Team)) +
  geom_line() +
  scale_color_manual(values=c("MSU"="green","UW"="red")) +
  xlab("Time (minutes)") +
  ylab("Score") +
  theme_classic()

# problem 2: guess my number

# generate random number 
answer = sample(1:100, 1)
# create interactive mode
guess <- readline("I'm thinking of a number 1-100...")
# establish a count of 0 to limit number of loops
count = 0

for(i in 1:10){
  guess <- readline("I'm thinking of a number 1-100...") #
  if(guess == answer){
    print("Correct!")
    break
  }else if(guess < answer){
    print("Higher!")
  }else{print("Lower!")}
  count <- count + 1
  if(count == 10){
    print("Better luck next time!")
  }
}







