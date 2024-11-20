library(tidyverse)
library(jsonlite)


data.file <- "data.json"
data.url <- "https://ods.railway.gov.tw/tra-ods-web/ods/download/dataResource/8ae4cabf6973990e0169947ed32454b9"
download.file(url = data.url, destfile = data.file)

data <- fromJSON(data.file) %>% filter( staCode == "1210", as.numeric(format(as.Date(trnOpDate,format="%Y%m%d"),"%d"))==1)

data$trnOpDate <- as.Date(as.character(data$trnOpDate),format = "%Y%m%d")
data$gateInComingCnt <- as.numeric(data$gateInComingCnt)
data$gateOutGoingCnt <- as.numeric(data$gateOutGoingCnt)

df <- data.frame(
  Month = as.numeric(format(data$trnOpDate, "%m")),
  Incoming_changes = data$gateInComingCnt - lag(data$gateInComingCnt),
  Outgoing_changes = data$gateOutGoingCnt -lag(data$gateOutGoingCnt)
) %>% filter(Month>1)
df
