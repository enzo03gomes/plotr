#' Set package-level environment for color palettes
#'
#' @noRd

.colorEnvir = new.env(parent = emptyenv())

#NOTE: when adding a new preset color palette to the package:
# - change palette.list
# - change blacklist


#' Assign variable with all palette options
#'
#' @noRd

assign("palette.list", value = list(), envir = .colorEnvir)

.colorEnvir$palette.list = list(
  "IBM" = c("#648FFF","#785EF0", "#DC267F", "#FE6100", "#FFB000"),
  "wong" = c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2","#D55E00","#CC79A7"),
  "tol" = c("#332288", "#117733", "#44AA99", "#88CCEE","#DDCC77","#CC6677", "#AA4499", "#882255")
  )

#' Define permanent (preset) palette options
#'
#' @noRd

assign("blacklist", value = 1:3, envir = .colorEnvir)



#' Assign variable with current palette
#'
#' @noRd

assign("current.palette", value = list(), envir = .colorEnvir)
.colorEnvir$current.palette = list("tol" = .colorEnvir$palette.list[["tol"]])


#' Print color palette
#'
#' @description
#' Workhorse function to print color palettes. Not available to users.
#'
#' @param p palette list
#' @param palette name of palette to use
#'

print.single = function(p, palette){
  if(missing(palette)){
    palette = names(p)[1]
  }

  pCurrent = p[[palette]]

  cat(palette, "\n")

  for(i in 1:length(pCurrent)){
    catStyle = crayon::make_style(pCurrent[i])

    cat(catStyle(pCurrent[i]), " ")
  }

  cat("\n\n")

  return(pCurrent)
}

