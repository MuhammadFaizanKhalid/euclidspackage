#' function for euclid or euclideans algorithm
#' to find out the GCD of two numbers
#' @param num1 is a number or an integer
#' @param num2 is a number or an integer
#' both parameters are inputs for euclidean
#' to find out their GCD
#' @return the GCD(greatest common divisor)
#' @examples
#' euclidean(123612, 13892347912)
#' euclidean(100, 1000)
euclidean <- function(num1, num2){
  if(!is.numeric(num1) && !is.numeric(num2)){
    if(!is.integer(num1) && !is.integer(num2)){
    stop();
    }
  }
  a <- 0
  b <- 0
  if(num1 < num2){
    a <- num2
    b <- num1
  }else{
    a <- num1
    b <- num2
  }
  rem <- 1
  i <- 1
  while(i != 0){
    if (rem != 0 && i !=1){
      a <- b
      b <- rem
    }
    quo <- a%/%b
    rem <- a%%b
    i <- rem
  }
  return(b)
}

