#' Test color validity
#'
#' @description
#' Check if all values in vector are coercible to RGB.
#'
#'
#' @param color vector of colors to test
#' @return TRUE if all elements can be translated into an RGB color, FALSE otherwise
#'
#' @keywords Utilities
#' @export

is.color = function(color){
  bol = TRUE
  bol = tryCatch(is.matrix(col2rgb(color)), error = function(e) FALSE)

  return(bol)
}



#' Test HEX color validity
#'
#' @description
#' Check if all values in vector are a valid HEX
#'
#' @param color vector of colors to test
#' @param digit6 if `TRUE`, tests for 6-digit HEX colors; otherwise, tests for 3-digit. `TRUE` by default.
#'
#' @keywords Utilities
#' @export

is.hex = function(color, digit6 = TRUE){
  #check validity of inputs
  if(!is.logical(digit6) | length(digit6) != 1){
    stop("digit6 must be logical")
  }

  pattern = ifelse(digit6, "^#[0-9A-Fa-f]{6}$", "^#[0-9A-Fa-f]{3}$")

  out = lapply(color, function(x){
    grepl(pattern, x)
    }) |> unlist()

  if(any(!out)){
    return(FALSE)
  }else{
    return(TRUE)
  }

}

