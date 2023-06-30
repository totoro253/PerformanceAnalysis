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


stock_prices_2010

# Get stock prices per Q1
Q1_2010 <- c("MSFT","GE") %>%
  tq_get(get = "stock.prices",
         from = "2010-01-01",
         to = "2010-03-01") %>%
  group_by(symbol)


Q1_2010

# Price per month in Q1
Q1_monthly <- c("MSFT","GE") %>%
  tq_get(get = "stock.prices",
         from = "2010-01-01",
         to = "2010-03-01") %>%
  group_by(symbol) 
 
  
  # Price per month in Q1
  Q1_Daily <- Q1_monthly %>%
       group_by(symbol) 
       tq_transmute(select = adjusted,
               mutate_fun = apply.daily,
               FUN = max,
               col_rename = "max.close") %>% 
    mutate(daily.qtr = paste0(daily(date), "-Q",daily(date))) %>%
    select(-date)
  

#Plot stock prices per month in Q1
ggplot(data = Q1_monthly, aes(x=date,y=adjusted, fill=symbol)) +
  geom_area(aes(y=close)
close))+
  theme_classic(()

# Correlation for the closing price related to adjusting price
Q1P1 <-ggplot(data = Q1_monthly, aes(x=date,y=adjusted, fill=close)) +
  geom_area() +
  facet_wrap(~symbol, scales="fixed", ncol =1) +
  theme_bw()

Q1P1 



# Adjusted prices 
Q1_Overview <-ggplot(Q1_Daily, aes(x=date,y=adjusted, color=symbol)) +
  facet_wrap(~symbol, scales="fixed", ncol =1) +
  geom_line(aes(y=close)) +
  geom_point() +
  theme_bw()

Q1_Overview





# Closing prices

Q1_Close <- ggplot(Q1_Daily, aes(x=date,y=close,  color=symbol)) +
  geom_line(aes(y=close)) +
  geom_point()+
  facet_wrap(~symbol,scales="free", ncol =1) +
  theme_bw()


Q1_Close 

# Adjust prices

Q1_Adjust <- ggplot(Q1_Daily, aes(x=date,y=adjusted, color=symbol)) +
  geom_line(aes(y=adjusted))+
  geom_point()+
  facet_wrap(~symbol,scales="free", ncol =1) +
  theme_bw()


Q1_Adjust









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

Q3_2010


# Get stock prices per Q4
Q4_2010 <- c("MSFT","GE") %>%
  tq_get(get = "stock.prices",
         from = "2010-09-01",
         to = "2010-12-01") %>%
  group_by(symbol)
Q4_2010 



