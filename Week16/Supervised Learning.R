dataset=read.csv("Admission_Predict.csv")
gre=dataset[,2]
coa=dataset[,9]
data=data.frame(gre, coa)

library(caTools)
set.seed(123)

split= sample.split(data$coa, SplitRatio = 0.8)
View(split)

training_set = subset(data,split==TRUE)
testing_set = subset(data,split==FALSE)
View(training_set)
View(testing_set)

regressor= lm(formula=coa~gre, data= training_set)

y_pred = predict(regressor,newdata = testing_set)

a =  testing_set$coa
b = y_pred

plot(a, type = 'o', col='blue',xlab = 'Count',ylab='COA')
lines(b,type='o',col='red')