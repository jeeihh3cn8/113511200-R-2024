f <- function(x){
  if (x == 1 || x == 2)
    return(1)
  else 
    return(f(x-1)+f(x-2))
}

print(f(22))