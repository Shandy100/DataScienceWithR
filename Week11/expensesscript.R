library(ggplot2)
library(dplyr)

expenses <- read.csv("dailyexpenses.csv")
expenses$Date <- as.Date(expenses$Date,
                         "%d/%m/%Y")
pc <- read.csv("piechart.csv")

#Compare Expenses
tot <- expenses[,2:9]
total<- colSums(tot)
detail <- c("food", "groceries", "medical", "fuel", "toll", "phone", "electricity", "miscellaneous")
df <- data.frame(detail, total)

ggplot(data = df, aes(x = detail, y = total)) +
  geom_bar(stat = "identity", fill = "purple")+
  labs(x = "Items",
       y = "Expenses",
       title = "Comparing Expenses")

#Total Expenses

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

#Pie Chart

pie <- ggplot(pc, aes(x = "", y=amount, fill = factor(expense))) +
  geom_bar(width = 1, stat = "identity") +
  theme(axis.line = element_blank(),
        plot.title = element_text(hjust=0.5)) +
  labs(fill="expense",
       x=NULL, y=NULL, title="Pie Chart of expenses")

pie + coord_polar(theta = "y", start=0)


#Medical Expenses

md <- expenses[,3]
de <- expenses[,1]
dm <- data.frame(de,md)

ggplot(data = dm, aes(x = de, y = md)) +
  geom_point() +
  labs(x = "Expenses",
       y = "Medical",
       title = "Medical Expenses")


#Histogram

ggplot(expenses, aes(x= Medical)) + 
  geom_histogram(binwidth = 5, color = "black", fill = "blue")


# Minimum and Maximum Values

tot <- expenses[,2:9]
total<- colSums(tot)
View(total)
minvalue <- min(total)
maxvalue <- max(total)




