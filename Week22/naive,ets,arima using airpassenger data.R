library(forecast)
library(MLmetrics)
data=AirPassengers
data

training = window(data,start = c(1949,1),end = c(1955,12))
testing = window(data, start = c(1956,1))

#NAIVE
naive0 = naive(training, h=length(testing))
View(naive0)
summary(naive0)

plot(data, col="blue", xlab="Year", ylab="Passengers", main="Naive Forecast", type='l')
lines(naive0$mean, col="green", lwd=2)

#ets
ets_model = ets(training, allow.multiplicative.trend = TRUE)
summary(ets_model)

ets_forecast = forecast(ets_model, h=length(testing))
MAPE(ets_forecast$mean, testing) *100

plot(data, col="blue", xlab="Year", ylab="Passengers", main="ETS Forecast", type='l')
lines(ets_forecast$mean, col="red", lwd=2)

# ARIMA
plot(data, main = "Before Forecasting")
fit <- auto.arima(data)
forecasting <- forecast(fit , 15)
plot(forecasting, main = "After Forecasting")
