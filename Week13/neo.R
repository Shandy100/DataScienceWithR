library(modeest) 
library(modest)
library(ggplot2)
library(moments) 
library(bayestestR)
library(dplyr)
library("MASS")

neo <- read.csv("neo.csv")

#Cleaning the data
neo$Object <- gsub("\\(|\\)","", neo$Object)
neo$CA.Date<- as.Date(neo$CA.Date, "%d-%m-%y")
str(neo)

#Finding mean,median and mode

diamin <- mean(neo$Estimated.Diameter.minimum..m.)
diamax <- mean(neo$Estimated.Diameter.maximum..m.)
avgvelr <- mean(neo$Vrelative..km.s.)
avddist <- mean(neo$CA.Distance.Minimum..au.)

middist <- median(neo$CA.Distance.Nominal..au.)

modemag <- mfv(neo$H..mag.)
View(modemag)

#Finding minimum and maximum value

mindist <- min(neo$CA.Distance.Minimum..au.)
maxdist <- max(neo$CA.Distance.Minimum..au.)
stand <-sd(neo$CA.Distance.Minimum..au.)

#Normal distributions 

x <- seq(0.00107, 0.04733, by = .001)
y <- dnorm(x, mean = 0.0253, sd = 0.0139)
plot(x,y)

hist(y, main = "Normal Distribution")

hist(neo$CA.Distance.Minimum..au.)

#Finding range
rangedist <- range(neo$Estimated.Diameter.maximum..m.)

#Finding Interquartile range
iqrrange <- IQR(neo$Estimated.Diameter.minimum..m.)

#Finding standard deviation and variance

varofvelocity <- var(neo$Vrelative..km.s.)
sdofvelocity <- sd(neo$Vrelative..km.s.)

#Finding Percentile
quantile(neo$CA.Distance.Nominal..au.)

plot(neo$CA.Date, neo$CA.Distance.Minimum..au.)

ggplot(neo)+
  aes(x = CA.Date, y = CA.Distance.Minimum..au.) +
  geom_line()

ggplot(neo)+
  aes(x = CA.Date, y = Estimated.Diameter.maximum..m.) +
  geom_line()
#Finding point estimate
point_estimate(neo, centrality = "all", dispersion = TRUE)
