#' Check if all values in vector are valid colors
#'
#' @param color vector of colors to test
#' @return TRUE if all elements can be translated into an RGB color, FALSE otherwise
#' @export

is.color = function(color){
  bol = TRUE
  bol = tryCatch(is.matrix(col2rgb(color)), error = function(e) FALSE)

  return(bol)
}
