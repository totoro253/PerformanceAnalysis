#DOTCOM Bubble

## What is the dotcom bubble?
The dotcom bubble was an asset valuation 
bubble that occurred in the 90s. 
It led to a recession caused by highly 
speculative investments in internet-based businesses. 
The bubble burst in early 2000 after investors realized many 
of these companies had business models that weren’t viable.

The dotcom bubble was an asset valuation bubble that occurred
from 1995 to 2000 in which investors 
poured money into highly speculative Internet-based companies. 
The dotcom bubble was largely caused by the
lack of due diligence by investors—they invested in 
Internet-based companies without qualifying
an investment with reliable metrics.

library(ggplot2)
library(tidyverse)
library(tidyquant)
library(lubridate)
library(timetk)

## What was the stock closing price in. Q1 1995?
stock_prices_1995_Q1 <- c("MSFT","GE") %>%
  tq_get(get = "stock.prices",
         from = "1995-01-01",
         to = "1995-04-01") %>%
  group_by(symbol)

stock_prices_1995_Q1 %>%
  ggplot(aes(x=date,y=close)) +
  geom_line()+
  facet_wrap(~symbol)

## What was the stock closing price in Q2 1995?

stock_prices_1995_Q2 <- c("MSFT","GE") %>%
  tq_get(get = "stock.prices",
         from = "1995-04-01",
         to = "1995-08-01") %>%
  group_by(symbol)

stock_prices_1995_Q2 %>%
  ggplot(aes(x=date,y=close)) +
  geom_line()+
  facet_wrap(~symbol)

## What was the stock closing price in Q3 1995?
stock_prices_1995_Q3 <- c("MSFT","GE") %>%
  tq_get(get = "stock.prices",
         from = "1995-08-01",
         to = "1995-12-01") %>%
  group_by(symbol)

stock_prices_1995_Q3 %>%
  ggplot(aes(x=date,y=close)) +
  geom_line()+
  facet_wrap(~symbol)


#What was the overal closing. price?
stock_prices_1995 %>%
  ggplot(aes(x=date,y=close)) +
  geom_line()+
  facet_wrap(~symbol)



## How did the adjusted price changed compaired to the opening price. in 1995?

stock_prices_1995 <- c("MSFT","GE") %>%
  tq_get(get = "stock.prices",
         from = "1995-01-01",
         to = "1995-12-01") %>%
  group_by(symbol)

ggplot(stock_prices_1995, aes(date, adjusted,  color=symbol)) +
  geom_line()

## What was the stock in 2000?
stock_prices_2000 <- c("MSFT","GE") %>%
  tq_get(get = "stock.prices",
         from = "2000-01-01",
         to = "2000-12-01") %>%
  group_by(symbol)

stock_prices_2000

ggplot(stock_prices_2000, aes(date, adjusted,  color=symbol)) +
  geom_line()

#Compare

stock_adjusted_2000 <-ggplot(stock_prices_2000, aes(date, adjusted,  color=symbol)) +
  geom_line()

stock_adjusted_1995<-ggplot(stock_prices_1995, aes(date, adjusted,  color=symbol)) +
  geom_line()

stock_prices_1995

stock_adjusted_2000


##. What was the overall adjusting price during the period of 1995 until 2000?
stock_prices_9520 <- c("MSFT","GE") %>%
  tq_get(get = "stock.prices",
         from = "1995-01-01",
         to = "2000-12-01") %>%
  group_by(symbol)

stock_prices_9520 %>%
  group_by(symbol) %>%
  mutate(close = close / close[1]) %>%
  ungroup () %>%
  ggplot(aes(x=date,y=close, col=symbol)) +
  geom_line()



open_19952000 <-ggplot(stock_prices_9520, aes(date, open,  color=symbol)) +
  geom_violin()



ggplot(stock_prices_9520, aes(date, close,  color=symbol)) +
  geom_line()



adjusted_1995200 <-ggplot(stock_prices_9520, aes(date, adjusted,  color=symbol)) +
  geom_line()
