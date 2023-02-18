library(tidyquant)
library(ggplot2)
library(dplyr)

#

## Importing stock prices
stock_prices <- c("MSFT","GE") %>%
  tq_get(get = "stock.prices",
         from = "1990-01-01",
         to = "2017-12-31") %>%
  group_by(symbol)
stock_prices

## Plotting adjusted price
stock_prices %>%
  ggplot(aes(x=date,y=adjusted)) +
  geom_line()+
  facet_wrap(~symbol)

#Plotting closing price
stock_prices %>%
  group_by(symbol) %>%
  mutate(close = close / close[1]) %>%
  ungroup () %>%
  ggplot(aes(x=date,y=close, col=symbol)) +
  geom_line()


#Summarizing closing , last value of GE and MSFT
stock_prices %>%
  group_by(symbol) %>%
  mutate(close = close/ close[1]) %>%
  summarise(last = last(close))

