library(ggplot2)
library(tidyverse)
library(tidyquant)
library(lubridate)
library(timetk)

## Importing stock prices
stock_prices <- c("MSFT","GE") %>%
  tq_get(get = "stock.prices",
         from = "1990-01-01",
         to = "2017-12-31") %>%
  group_by(symbol)
stock_prices


# Prices per quarter
stock_prices_quarterly <- stock_prices %>%
  group_by(symbol) %>%
  tq_transmute(select = adjusted,
               mutate_fun = apply.quarterly,
              FUN = max,
              col_rename = "max.close") %>% 
  mutate(year.qtr = paste0(year(date), "-Q",quarter(date))) %>%
  select(-date)

stock_prices_quarterly

ggplot(stock_prices_quarterly, aes(symbol, max.close)) +
  geom_point() +
  facet_wrap(~year.qtr, ncol=4)



#Plot: Maximum close based per quarter and classified by maximum close for each stock
stock1 <- ggplot(stock_prices_quarterly, aes(x=symbol, y=max.close, group=symbol)) + 
  geom_boxplot(aes(fill=max.close))

stock1




