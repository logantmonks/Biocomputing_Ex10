## Biocomputing - Exercise 10
## Using control structures in R 
## 29 November 2022 - Catherine Andreadis 

#-------------------------------------------------------------------------------

#Set working directory

setwd("/Users/catherineandreadis/Desktop/biocomputing/Biocomputing_Ex10")
getwd()
list.files()

#Load packages 
library(dplyr)
library(tidyverse)
library(ggplot2)

#1. Generate a line graph that depicts the cumulative score for U of Wisconsin 
# and Michigan State University during a basketball game as a function of time 
# in the game. 

#First, download and inspect the data:
basketball <- read.table("UWvMSU_1-22-13.txt", header = TRUE)


#Then, generate a dataframe where scores are cumulative for each team over time 


#Separate both into 2 dataframes by team, I personally find this easier to work 
#with 
UW <- basketball[basketball$team ==  "UW",]
MSU <- basketball[basketball$team == "MSU",]

#Do the cumulative score for each team over the course of the game, I've 
#used the dplyr syntax before and find it works for me
UW_2 <- UW %>% mutate(cum_score = cumsum(score))
MSU_2 <- MSU %>% mutate(cum_score = cumsum(score))

#Combine the two datasets into a new dataframe
new_basketball <- rbind(UW_2,MSU_2)

#Make the graph 
ggplot(new_basketball, aes(x=time, y=cum_score))+
  geom_line(aes(color = team, linetype = team))+
  scale_color_manual(values = c("darkgoldenrod2", "cornflowerblue"))+
  ylab("cumulative score")
  theme_classic()


#2. Write a game called "guess my number". The computer will generate a random 
#number between 1 and 100. The user types in a number and the computer replies 
#lower if the random number is lower than the guess, "higher" if the random 
#number is higher, and "correct"! if the guess is correct. The player 
#can continue guessing up to 10 times. 

#set the number of maximum guesses 

Maxguesses=10 


#Make the game

guess_my_number <- function (input){
  number <- sample (1:100, 1)
  guessCount = 0
  guessLimit = 10

 if (input == number)
    print("correct!")
  else if (input > number)
    print("lower")
  else if (input < number)
    print("higher")
}
  

guess_my_number(99)
guess_my_number(89)
