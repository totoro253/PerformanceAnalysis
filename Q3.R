library(ggplot2)
library(tidyverse)
library(tidyquant)
library(lubridate)
library(timetk)

## Stock prices: Microsoft and General electric by the period of 1 january 2010 until 1 december 2010
stock_prices_2010 <- c("MSFT","GE") %>%
  tq_get(get = "stock.prices",
         from = "2010-01-01",
         to = "2010-12-01") %>%
  group_by(symbol)

# Get stock prices per Q1
Q1_2010 <- c("MSFT","GE") %>%
  tq_get(get = "stock.prices",
         from = "2010-01-01",
         to = "2010-03-01") %>%
  group_by(symbol)

Q1_Q<- c("MSFT","GE") %>%
  group_by(symbol)
  tq_transmute(select = adjusted,
             mutate_fun = apply.quarterly,
             FUN = max,
             col_rename = "max.close") %>% 
  mutate(year.qtr = paste0(year(date), "-Q",quarter(date))) %>%
  select(-date)




# Get stock prices per Q2
Q2_2010 <- c("MSFT","GE") %>%
  tq_get(get = "stock.prices",
         from = "2010-03-01",
         to = "2010-06-01") %>%
  group_by(symbol)



# Get stock prices per Q3
Q3_2010 <- c("MSFT","GE") %>%
  tq_get(get = "stock.prices",
         from = "2010-06-01",
         to = "2010-09-01") %>%
  group_by(symbol)


# Get stock prices per Q4
Q4_2010 <- c("MSFT","GE") %>%
  tq_get(get = "stock.prices",
         from = "2010-09-01",
         to = "2010-12-01") %>%
  group_by(symbol)




