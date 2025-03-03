#' Check if vector is cohersible to numeric
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
