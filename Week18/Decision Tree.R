# Decision Tree Classification
#1. Import the dataset
#Use Import dataset
Dataset=student_dataset[2:6]
View(Dataset)
str(Dataset)

Dataset$certificate<-as.factor(Dataset$certificate)
print(levels(Dataset$certificate))

library(caTools)
set.seed(123)

split= sample.split(Dataset$certificate, SplitRatio = 0.75)
View(split)

training_set = subset(Dataset,split==TRUE)
testing_set = subset(Dataset,split==FALSE)
View(training_set)
View(testing_set)

#install.packages("rpart")
library(rpart)

classifier = rpart(formula = certificate ~ ., data = training_set)

y_pred = predict(classifier, newdata = testing_set,type = 'class')

View(y_pred)
View(testing_set$certificate)

cm = table(testing_set$certificate, y_pred)
View(classifier)
plot(classifier)
text(classifier)
