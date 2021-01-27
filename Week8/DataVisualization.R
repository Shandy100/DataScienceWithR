View(mtcars)
count<-table(mtcars$gear)

View(count)

plot(count)
barplot(count)
barplot(count, horiz=TRUE)
barplot(count, main="simple bar plot",
        xlab = "Gears",
        ylab = "Count",
        legend = rownames(count),
        col=c("red","yellow","green"))
#let's analyze titanic scenario
#Download Titanic Dataset
#Set the folder as working directory
Titanic<-read.csv("titanic.csv",stringsAsFactors = FALSE)
#Analyze the data
str(Titanic)
View(Titanic)

#Install GGPLOT2 library (Grammar of Graphics)
install.packages("ggplot2")
library(ggplot2)
Titanic$sex<-as.factor(Titanic$sex)
Titanic$pclass<-as.factor(Titanic$pclass)
Titanic$survived<-as.factor(Titanic$survived)
Titanic$embarked<-as.factor(Titanic$embarked) 
str(Titanic)
#Let's first understand the people survived
?prop.table()
prop.table(table(Titanic$survived))
ggplot(Titanic,aes(x=survived))+geom_bar()


ggplot(Titanic,aes(x=survived))+
  theme_classic()+
  geom_bar()+
  labs(y="Passenger count",
       title = "Titanic Survival Count")
ggplot(Titanic,aes(x=survived))+
  geom_bar()


#Gender wise survival
ggplot(Titanic,aes(x=survived))+
  theme_classic()+
  geom_bar()+
  labs(y="Passenger count",
       title = "Titanic Survival Count")