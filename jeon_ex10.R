# hjeon
# Exercise10

########### Question 1 #############
# import library for plotting functionalities
library(latticeExtra)
library(dplyr)
library(ggplot2)
# be sure to set your working directory
setwd("/Users/hyesooclarejeon/Desktop/Biocomputing_Ex10")
set.seed(1)
# read table separately for UW and MSU
uw_scores <- read.table("UWvMSU_1-22-13.txt", header = TRUE, sep = "\t")
msu_scores <- read.table("UWvMSU_1-22-13.txt", header = TRUE, sep = "\t")

# filter rows according to team names
uw_scores <- uw_scores %>% filter_at(vars(team), any_vars(. %in% c('UW')))
msu_scores <- msu_scores %>% filter_at(vars(team), any_vars(. %in% c('MSU')))

# map to creaete cumulative sum list
uw_cumulative <- cumsum(uw_scores[3])
msu_cumulative <- cumsum(msu_scores[3])

# pass in cumulative list to dataframe
uw_df <- data.frame(uw_cumulative)
msu_df <- data.frame(msu_cumulative)

# define column names for time plot
columns <- c("1st", "2nd", "3rd", "4th")

# Draw plot with 2 data frames from teams above
ggplot(NULL, aes(x = columns)) + geom_line(data = uw_df, col = "black") + geom_line(data = msu_df, col = "blue")

###############################################################################
#################### Question 2 ###################
guess_my_number <- function() {
  random_number <- sample(1:100, 1, replace=TRUE)
  count <- 10
  cat("I'm thinking of a number 1-100")
  while (count > 0) {
    count <- (count - 1)
    guess = as.integer(readline())
    if (random_number == guess) {
      return("Correct")
    } else if (random_number > guess) {
      cat("Higher. ")
    } else {
      cat("Lower. ")
    }
    if (count > 0) { cat("Guess: ") }
  }
  print("The correct number was")
  cat(random_number)
}

guess_my_number()
