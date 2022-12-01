#Question1
#Goal of project: Plot scores of each team over the course of the game

#basic plot requires data, aesthetic, and geom structure
#create dataframe
GameData<-read.csv("UWvMSU_1-22-13.txt", header=TRUE, sep="")

#load data
ggplot(data="UWvMSU_1-22-13.txt", x="time", y="score")
#type of graph that we need
geom_smooth()
