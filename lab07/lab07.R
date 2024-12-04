library(httr)
library(XML)

html <- htmlParse(GET("https://disp.cc/m/"))
ht_title <- xpathApply(html, "//div[@class='ht_title']", xmlValue)
ht_desc <- xpathApply(html, "//div[@class='ht_desc']", xmlValue)

separator <- "---"
data <- cbind( ht_title, ht_desc, separator )

file.path <- "GitHub/113511200-R-2024/lab07/113511200.txt"
#我的lab07資料夾放在Document的Github的113511200-R-2024的資料夾內，所以相對路徑的名字比較長
write.table(
  data,
  file = file.path,
  append =TRUE,
  quote = FALSE,
  sep = "\n",
  row.names = FALSE,
  col.names = FALSE
)
file.exists("GitHub/113511200-R-2024/lab07/113511200.txt")



