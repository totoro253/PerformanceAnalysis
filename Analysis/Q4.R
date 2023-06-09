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

## What was the stock in 1995?
stock_prices_1995 <- c("MSFT","GE") %>%
  tq_get(get = "stock.prices",
         from = "1995-01-01",
         to = "1995-12-01") %>%
  group_by(symbol)

stock_prices_1995

## How did the adjusted price changed compaired to the opening price. in 1995?
ggplot(stock_prices_1995, aes(date, open,  color=close)) +
  geom_line()



## What was the stock in 2000?