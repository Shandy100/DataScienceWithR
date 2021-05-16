library(forecast)

View(EuStockMarkets)

plot(EuStockMarkets[,"DAX"], main = "Before Forecasting")

fit <- auto.arima(EuStockMarkets[,"DAX"])

forecasting <- forecast(fit, 50)
print(forecasting)
plot(forecasting, main = " After Forecasting")

library(forecast)

View(EuStockMarkets)

plot(EuStockMarkets[,"SMI"], main = "Before Forecasting")

fit <- auto.arima(EuStockMarkets[,"SMI"])

forecasting <- forecast(fit, 50)
print(forecasting)
plot(forecasting, main = " After Forecasting")
