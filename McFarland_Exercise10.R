# Troy McFarland
# Exercise 10
# Dec 2 2022

# 1)

# read in data
raw_scores <- read.delim('UWvMSU_1-22-13.txt', sep = "\t")

# initialize some variables
UW_score = 0
MSU_score = 0
UW_scores <- data.frame()
UW_times <- data.frame()
MSU_scores <- data.frame()
MSU_times <- data.frame()

# step through data, checking for UW scores and times and adding them to separate lists
for (i in 1:50) {
  if (raw_scores$team[i] == "UW")
  {
  UW_score = UW_score+raw_scores$score[i]
  UW_scores <- append(UW_scores, UW_score)
  UW_times <- append(UW_times, raw_scores$time[i])
  }
}

# combine lists, force lists into being a dataframe (had issues with lists being fed to ggplot)
UW_data <- data.frame(cbind(UW_times, UW_scores))
UW_data <- as.data.frame(lapply(UW_data, unlist))
# rename columns to avoid ggplot issues with variables of same name
colnames(UW_data) <- c('time', 'score')

# step through data, checking for MSU scores and times and adding them to separate lists
for (i in 1:50) {
  if (raw_scores$team[i] == "MSU")
  {
    MSU_score = MSU_score+raw_scores$score[i]
    MSU_scores <- append(MSU_scores, MSU_score)
    MSU_times <- append(MSU_times, raw_scores$time[i])
  }
}

# combine lists, force lists into being a dataframe (had issues with lists being fed to ggplot)
MSU_data <- data.frame(cbind(MSU_times, MSU_scores))
MSU_data <- as.data.frame(lapply(MSU_data, unlist))
# rename columns to avoid ggplot issues with variables of same name
colnames(MSU_data) <- c('time', 'score')

# plot! with team colors!
ggplot() +
  geom_line(data = UW_data, aes(x = time, y = score), color = "red") +
  geom_line(data = MSU_data, aes(x = time, y = score), color = "green") +
  theme_classic()

# 2)
# rng
the_number = sample(100,1)
# taunt the player
print("You look like somebody that couldn't guess a randomly generated number between 1-100...")
print("Care to prove me wrong?? >:D")
print("Guess a number.")
# for loop steps through ten tries
for (i in 1:10) {
  # saves input
  user_guess <- readline()
  # tests input, breaks loop if correct
if (user_guess == the_number) {
  print("Correct!") 
  print("Hmph. Obviously, you were cheating.") 
  break 
  # if wrong, tells if the number is higher or lower
} else if (user_guess > the_number) {
  print("HA! Not even close! Well, maybe it was close. I'm not telling you that.")
  print("Guess a lower number.") 
} else if (user_guess < the_number) {
  print("HA! Not even close! Well, maybe it was close. I'm not telling you that.")
  print("Guess a higher number.") 
}
  # gives the answer after ten tries
  if (i == 10) {
  print("Ya know... it's really not that hard.")
  cat("The number was ",the_number,".", sep = "")
}
}