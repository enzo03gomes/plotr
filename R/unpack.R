#' Assigns variables from package-level environments to function environments
#'
#' @description
#' Moves all parameters (loaded palette, plot settings and graphical parameters) to the parent environment.
#'
#'
#' @param var variable name to export
#' @param package.envir package-level environment
#' @param user.envir user-level environment
#'
#'

unpack = function(){
  envir = parent.frame()
  #assign color palette
  assign("palette", .colorEnvir$current.palette, envir = envir)

  #assign plot settings
  assign("plotSettings", .plotEnvir$current.settings, envir = envir)

  #assign par
  assign("parSettings", .parEnvir$current.par, envir = envir)
}


