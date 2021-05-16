# Single Time Series

rainfall <- c(799,1174.8,865.1,1334.6,635.4,918.5,685.5,998.6,784.2,985,882.8,1071)
View(rainfall)

print(rainfall)

timeseries <- ts(rainfall,start = c(2020,1),frequency = 12)
print(timeseries)
View(timeseries)
plot(timeseries)

library(forecast)

fit <- auto.arima(timeseries)

forecasting <- forecast(fit,5)
print(forecasting)
plot(forecasting)

#Multiple Timeseries
chennai <- c(799,1174.8,865.1,1334.6,635.4,918.5,685.5,998.6,784.2,985,882.8,1071)
bangalore <- c(655,1306.9,1323.4,1172.2,562.2,824,822.4,1265.5,799.6,1105.6,1106.7,1337.8)

combined <- matrix (c(chennai,bangalore), nrow=12)
View(combined)
timeseries<-ts(combined, start=c(2020,1),frequency=12)
print(timeseries)
plot(timeseries)
