library(rvest)
library(robotstxt)
library(dplyr)
library(ggplot2)

DE<-read.csv("dailyexpenses.csv")
#Analyze the data
View(DE)
str(DE)
DE$Date<-as.Date(DE$Date,"%d/%m/%Y")

pc<-read.csv("piechart.csv")

#Compare Expenses
fd<-DE[,2]
a1<-sum(fd)

groc <-DE[,3]
a2 <- sum(groc)

med <-DE[,4]
a3 <- sum(med)

fl <-DE[,5]
a4 <- sum(fl)

tl <-DE[,6]
a5 <- sum(tl)

ph <-DE[,7]
a6 <- sum(ph)

electric <- DE[,8]
a7 <- sum(electric)

misc <- DE[,9]
a8 <- sum(misc)

detail <- c("food", "groceries", "medical", "fuel", "toll", "phone", "electricity", "miscellaneous")
total <- c(a1, a2, a3, a4, a5, a6, a7, a8)

df<- data.frame(detail,total)
View(df)

ggplot(data = df, aes(x = detail, y = total))+
  geom_bar(stat = "identity", fill = "purple")+
  labs(x = "Items",
       y = "Expenses",
       title = "Comparing Expenses")

#Total Expenses
cm <- DE[,2:9]
dt <- DE[,1]

rs<- rowSums(cm)
#cs<-colSums(cm)
#View(cs)

dg <-data.frame(dt,rs)

ggplot(data = dg, aes(x = dt, y = rs,group=1))+
  geom_line(color = "#00AFBB", size = 2)+
  labs(x = "Date",
       y = "Expenses",
       title = "Total Expenses")

#Pie Chart of Expenses

pie <-  ggplot(pc, aes(x = "", y=amount, fill = factor(expense))) +
  geom_bar(width = 1, stat ="identity")+
  labs(fill="expense",
       x=NULL, y=NULL, title="Pie Chart of expenses")

pie + coord_polar(theta = "y", start = 0)

#Medical Expenses
#scattershot
md <- DE[,4]
de <- DE[,1]
dm <- data.frame(de,md)


ggplot(data = dm, aes(x = de, y = md))+
  geom_point(size = 4)+
  labs(x = "Expenses",
       y = "Medical",
       title = "Medical Expenses")
#distribution of medical expenses
#histograph
ggplot(DE, aes(x= Medical)) +
  geom_histogram(binwidth = 5, fill = "blue")

#Minimum and Maximum Values
tot<-DE[,2:9]
total<-colSums(tot)
minvalue<-min(total)
maxvalue<-max(total)

cm <- expenses[,2:9]
dt <- expenses[,1]
rs <-rowSums(cm)
View(rs)
dg <- data.frame(dt,rs)

ggplot(data = dg, aes(x = dt, y = rs)) +
  geom_line(color = "red", size = 2) +
  labs(x = "Date",
       y = "Expenses",
       title = "Total Expenses")