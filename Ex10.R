# Ex10.R: A script to execute the problems outlined by Exercise 10
# Assume you are in the Biocomputing_Ex10 directory

# First need to access the data
scores <- read.table("UWvMSU_1-22-13.txt", header=TRUE)
# Make data frame for the scores
df <- data.frame("Time", "UWScore", "MSUScore")

df
