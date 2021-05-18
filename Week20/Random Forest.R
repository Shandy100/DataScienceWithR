data1 <- read.csv("Car_data.csv",header = TRUE)
View(data1)
str(data1)

data1$BuyingPrice<-as.factor(data1$BuyingPrice)
data1$Maintenance<-as.factor(data1$Maintenance)
data1$NumDoors<-as.factor(data1$NumDoors)
data1$NumPersons<-as.factor(data1$NumPersons)
data1$BootSpace<-as.factor(data1$BootSpace)
data1$Safety<-as.factor(data1$Safety)
data1$Condition<-as.factor(data1$Condition)

set.seed(123)
train <- sample(nrow(data1), 0.7*nrow(data1), replace = FALSE)

#set.seed(100)
#train <- sample(nrow(data1), 0.7*nrow(data1), replace = FALSE)
#View(train)
#trainSet <- data1[train,]
#testSet <- data1[-train,]


set.seed(100)
train <- sample(nrow(data1), 0.7*nrow(data1), replace = FALSE)
View(train)
TrainSet <- data1[train,]
TestSet <- data1[-train,]
summary(TrainSet)
summary(TestSet)
library(randomForest)

model1 <- randomForest(Condition ~ ., data = TrainSet,importance = TRUE )
model1

predValid <- predict(model1, TestSet, type = "class")
View(predValid)
table(predValid, TestSet$Condition)

model2 <- randomForest(Condition ~., data = TrainSet, ntree = 500, mtry = 6, importance = TRUE)
predValid <- predict(model2, TestSet, type = "class")
table(predValid, TestSet$Condition)
#dontuse
plot(model1)
plot(model2)
