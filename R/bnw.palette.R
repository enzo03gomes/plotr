#' Convert colors to black and white
#'
#' @description
#' Converts a vector of HEX values to their respective black and white variants, also in HEX.
#'
#' @param color vector of HEX
#'
#' @export

bnw.palette = function(color){
  #check if input is valid
  if(!is.color(color)) stop("invalid color")

  #convert to RGB
  rgbVals = col2rgb(color)

  #convert to black and white RGB (ie. calculate luminance)
  bnwVec = apply(rgbVals, 2,
                 function(x) 0.299 * x[1] + 0.587 * x[2] + 0.114 * x[3]) |>
            as.integer()

  bnwMatrix = matrix(bnwVec, ncol = length(color), nrow = 3, byrow = TRUE)

  #convert back to HEX
  bnw = apply(bnwMatrix, 2, function(x) sprintf("#%02X%02X%02X", x[1], x[2], x[3]))

  return(bnw)
}
