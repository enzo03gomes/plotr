#' Test if variable contains numbers
#'
#' @description
#' Check if vector is coercible to numeric.
#'
#'
#'
#' @param x vector to analyse
#' @export

is.number = function(x){
  if(is.numeric(x) | is.integer(x) | is.double(x)){
    return(TRUE)
  }else{
    return(FALSE)
  }
}
