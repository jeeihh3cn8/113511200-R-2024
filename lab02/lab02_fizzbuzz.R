v <- list()
a <- 0
b <- 0
c <- 0
d <- 0
for(i in 1:1000){
  if (i%%3 == 0){
    if(i%%5 == 0){
      v <-append(v,"FizzBuzz")
    }else{
      v <- append(v,"Fizz")
    }
  }else if(i%%5 == 0){
    v <-append(v,"Buzz")
  }else{
    v <- append(v, i)
  }
}
for (i in v){
  if (i == "Fizz"){
    a = a+1
  }else if(i == "Buzz"){
    b = b+1
  }else if(i == "FizzBuzz"){
    c = c+1
  }else{
    d = d+i
  }
}

ans <- c(a, b, c, d)
print(ans)