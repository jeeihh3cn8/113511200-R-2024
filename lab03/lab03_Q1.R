multiply <- function(x){
  result = 1
  for (i in x){
    result = (result * i) %% 65537
  }
  print(result)
}

c1 <- c(20, 22, 10, 13)
multiply(c1)
c2 <- c(2022,1013)
multiply(c2)
c3 <- seq(from=1,to=30,by=1)
multiply(c3)