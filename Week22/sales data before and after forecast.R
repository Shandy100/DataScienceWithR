library(forecast)

View(BJsales)
print(BJsales)

plot(BJsales, main = "Before Forecasting")

fit <- auto.arima(BJsales)
forecasting <- forecast(fit, 25) #50 is too long
print(forecasting)

plot(forecasting, main = "After Forecasting")
