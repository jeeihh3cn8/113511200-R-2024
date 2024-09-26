ans <- list(267,134,66,266332)
v <- c()
for (i in ans){
  flag <-0
  while(i!=1){
    if (i %%2 != 0){
      i <- 3*i +1
    }else{
      i <- i/2
    }
    flag <- flag + 1
  }
  v <- append(v,flag)
}
v