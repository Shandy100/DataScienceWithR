dataset = read.csv("Admission_Predict.csv")
data=dataset[,2:9]
View(data)

split = sample.split(data$Chance.of.Admit, SplitRatio = 0.8)
View(split)

training_set=subset(data,split==TRUE)
testing_set=subset(data,split==FALSE)
View(training_set)
View(testing_set)
regressor = lm(formula = Chance.of.Admit~., data = training_set)
y_pred = predict(regressor, newdata = testing_set)

a = testing_set$Chance.of.Admit
b = y_pred

plot(a,type='o',col='blue',xlab='COUNT',ylab='COA')
lines(b,type='o',col='red')