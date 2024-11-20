library(tidyverse)
library(jsonlite)


data.file <- "data.json"
data.url <- "https://ods.railway.gov.tw/tra-ods-web/ods/download/dataResource/8ae4cabf6973990e0169947ed32454b9"
download.file(url = data.url, destfile = data.file)

data <- fromJSON(data.file) %>% filter( staCode == "1210", as.numeric(format(as.Date(trnOpDate,format="%Y%m%d"),"%d"))==1)

data$trnOpDate <- as.Date(as.character(data$trnOpDate),format = "%Y%m%d")
data$gateInComingCnt <- as.numeric(data$gateInComingCnt)

ggplot(data, aes(x = trnOpDate, y= gateInComingCnt, group =1))+
  geom_line()+
  geom_point()+
  labs(title = "Hsin Chu Station", x = "Date", y="Gate In Coming Count")+
  scale_y_continuous(breaks = seq(0, max(data$gateInComingCnt, na.rm = TRUE),by= 2500))+
  scale_x_date(date_labels = "%b")+
  theme_minimal()