library(httr)
library(XML)

html <- htmlParse(GET("https://disp.cc/m/"))
ht_title <- xpathApply(html, "//div[@class='ht_title']", xmlValue)
ht_desc <- xpathApply(html, "//div[@class='ht_desc']", xmlValue)

separator <- rep("---", length(ht_title))
data <- cbind( ht_title, ht_desc, separator )

file.path <- "./113511200.txt"
write.table(
  data,
  file = file.path,
  append =TRUE,
  quote = FALSE,
  sep = "\n",
  row.names = FALSE,
  col.names = FALSE
)

